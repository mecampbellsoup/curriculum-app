class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :role_names, :registered, :subdomain, :organization
  has_secure_password
  before_save :sanitize_name_and_email
  ###Try using an array when working

  validates_presence_of :password, :on => :create, :message => 'not found'
  validates_presence_of :email, :on => :create, :message => 'not found'
  validates_uniqueness_of :email, :on => :create, :message => 'not found'
  validates_presence_of :organization, :on => :create, :message => 'not found'
  has_many :user_assignments
  has_many :assignments, :through => :user_assignments

  has_many :authored_assignments, class_name: "Assignment", foreign_key: "author_id"
  has_many :created_groups, class_name: "Group", foreign_key: "created_by_id"

  has_many :user_groups
  has_many :groups, :through => :user_groups
  belongs_to :organization
  

  ROLES = {:admin => 0, :teacher => 1, :student => 2}
  def subdomain
  end
  def subdomain=(subdomain)
    self.organization = Organization.find_by_subdomain(subdomain.strip)
  end
  def sanitize_name_and_email
    if name
      name.strip!
    end
    email.strip! if email 
    register
    true
  end

  def register
    if self.name && self.name != ""
      self.registered= true 
    else
      self.registered = false
    end
  end

  def email_invite
    UserMailer.invitation(self)
  end

  def self.registered
    where(:registered => true)
  end

  def self.invited
    where(:registered => false)
  end

  def self.create_authentication_token
    SecureRandom.hex(24)
  end
  
  def assigned_by_me?(assignment)
    assignment.author == self 
  end

  def set_status(assignment,status)
    ua = user_assignments.find_by_assignment_id assignment.id
    if ua
      ua.update_attributes(:status => status)
    end
  end

  def status(assignment)
   (user_assignments.find_by_assignment_id assignment.id).status
  end

##Depricated 12/11/12
  def github_link(assignment)
    (user_assignments.find_by_assignment_id assignment.id).github_link
  end
##end
  def all_assignments_and_status
    assignments.collect do |assignment|
      [assignment,status(assignment)]
    end
  end

  def role_symbols
    ROLES.map do |role, i|
      role.to_sym
    end
  end

  def random_password
    Array.new(10).map { (65 + rand(58)).chr }.join
  end

  def new_password
    password  = self.random_password
    self.password = password
    self.save!
    UserMailer.create_and_deliver_password_change(self, password).deliver
  end

  def is_unconfirmed?
    !registered
  end
end
