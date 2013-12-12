class Group < ActiveRecord::Base
  include AddStudent

  attr_accessible :title, :body, :name,:student_names, :group_names,:user_names
  has_many :user_groups
  has_many :users, :through => :user_groups
  belongs_to :created_by, :class_name => "User", :foreign_key => "created_by_id"

  def self.return_groups_hash(group)
    group.each_with_object({}) do |group, hash|
      hash[group.name] = group.users.map { |user| {name: user.name, email: user.email}   }
    end 
  end

    #return a hash of all groups that a user has created
  def user_names
  end
   def user_names=(user_names)
    user_names = user_names.split(',').map { |u| u.strip }
    deleted_users = self.users.reject{ |u| user_names.include?(u.name)  }
    remove_users(deleted_users)
    user_names.each do |user_name|
      if user_name.include?("@")
        add_user_by_email(user_name)
      else
        add_user(user_name)
      end
    end
  end

  def remove_users(users)
    #delete user_group
    users.each do |user|
      ua = UserGroup.find_by_user_id_and_group_id(user.id,id)
      ua.destroy
    end
  end

  def add_user(user)
    user = User.find_by_name(user)|| User.find_by_email(user) unless user.is_a? User
    unless user_is_assigned?(user)
      user_groups.create(user_id: user.id) 
    end
  end

  def has_user?(user)
    true if user_groups.find_by_user_id(user.id)
  end

  def created_by?(user_id)
    self.created_by == user_id
  end
end

def user_is_assigned?(user)
  if user
    UserGroup.find_by_user_id_and_group_id(user.id, self.id)
  else
    true
  end
end

def add_user_by_email(email)
  unless user = User.find_by_email(email)
     user = User.create(:email => email) 
     user.password = user.random_password
     user.email_invite
  end
  add_user(user)
end


