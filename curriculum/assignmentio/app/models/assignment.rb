class Assignment < ActiveRecord::Base
  include AddStudent
  attr_accessible :due_date, :name, :student_names, :group_names, :content, :student_emails, :remove_student, :user_names, :notify_change, :emails, :group_name, :assignment_file
  validates_presence_of :name, :content, :on=> :create

  has_many :user_assignments, :dependent => :destroy
  has_many :users, :through => :user_assignments
  belongs_to :author, :class_name => "User", :foreign_key => "author_id"
  has_many :submissions 

  mount_uploader :assignment_file, AssignmentFileUploader

  def notify_change=(var)
    self.users.each {|user| UserMailer.assignment_change(user, self).deliver} if var
  end


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

#depricated as of 12/1
# #used in API
#   def student_emails
#   end
#   def student_emails=(emails)
#     emails.split(",").each do |email|
#       add_user_by_email(email.strip.downcase)
#     end
#   end

  def group_name
  end
  def group_names
    
  end
#   def group_name=(string)
#     string.split(",").each do |groupname|
#       add_group(groupname)
#     end  
#   end
# #end


  def status(user)
   assignment = user_assignments.find_by_user_id(user.id)
   assignment.status if assignment
  end

  def submission(user)
   user_assignments.find_by_user_id(user.id).submission
  end


  def number_completed
      all_assigned = self.users
      number_complete = all_assigned.select{|u| self.status(u)  == "Submitted"}.count
      number_graded = all_assigned.select{|g| self.status(g) == "Graded"}.count
      total = all_assigned.count
      "#{number_complete + number_graded}/#{total}"
  end


  def overdue?
    self.due_date < Date.today && self.user_assignments.submissions.length==0      
  end
  
  
  def all_submissions(user)
    as = UserAssignment.find_by_user_id(user.id)
    if as
      as = as.submissions 
    else
      as = []
    end
  end



  def remove_users(users)
    #delete user_assignment
    users.each do |user|
      ua = self.user_assignments.find_by_user_id(user.id)
      ua.destroy
    end
  end



private
  def add_group(groupname)
    Group.find_or_initialize_by_name(groupname).users.each do |user|
      add_user(user)       
    end 
  end

  def add_user(user)
    user = User.find_by_name(user) unless user.is_a? User
    
    unless user_is_assigned?(user)
      user_assignments.create(user_id: user.id, status: "Incomplete")
    end
  end

  def user_is_assigned?(user)
    if user
      UserAssignment.find_by_user_id_and_assignment_id(user.id, self.id)
    else
      true
    end
  end

  def add_user_by_email(email)
    unless user = User.find_by_email(email)
       user = User.new(:email => email) 
       user.new_password
       user.email_invite
    end
    add_user(user)
  end
end


