class User < ActiveRecord::Base
  attr_accessible :username, :is_instructor, :email, :password, :password_confirmation
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email, :scope => :organization_id
  validates_associated :organization

  before_create { generate_token(:auth_token) }
  # validates_presence_of :username
  # validates_uniqueness_of :username
  belongs_to :organization
  has_many :issues
  has_many :comments
  has_many :answers
  has_many :votes
  has_many :authentications

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end


  def my_issues
    if self.is_instructor
      Issue.all.collect{ |issue| issue if issue.instructor_asked? }.compact
    else
      self.issues
    end
  end

  def last_issue_is_fresh?
    if issues.last
       issues.last.fresh? ? true : false
     else
      false
    end
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
