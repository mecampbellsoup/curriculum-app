class User < ActiveRecord::Base
  attr_accessible :email, :name, :github_id

  has_many :repos
  has_many :user_projects
  has_many :projects, :through => :user_projects
  has_many :technologies, :through => :features

  validates :email, :uniqueness => true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :update, :allow_nil => true

  after_destroy :prune_repos, :disassociate_projects

  def tech_features(chosen_tech)
    Feature.joins(:technologies).where(:user_id => self.id, :technologies => {:name => chosen_tech.name})
  end

  def editable_by?(user)
    self == user
  end

  def can?(action, object)
    object.send("#{action}able_by?", self)
  end

  def features
    user_projects.collect(&:features).flatten
  end

  def self.search(query)
    where("name like ?", "%#{query}%")
  end

  def self.from_omniauth(auth)
    where(:github_id => auth["uid"]).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.github_id = auth["uid"]
      user.name = auth["info"]["nickname"]
      user.email = auth["info"]["email"]
      user.avatar_url = auth["info"]["image"]
      user.token = auth["credentials"]["token"]
      user.registered = false
    end
  end

  def prune_repos
    self.repos.each { |repo| !repo.project_id ? repo.destroy : repo.user_id = nil } 
  end

  def associate_with_existing_projects ## Maybe use an error catch for each on NilClass so we can iterate over the original database response
    old_projects = UserProject.where(:contributor_github_id => self.github_id)
    if !old_projects.empty?
      old_projects.each do |old_project|
        old_project.user_id = self.id
        old_project.save
      end
    end
  end

  def disassociate_projects
    self.user_projects.each { |user_project| user_project.user_id = nil }
  end
end
