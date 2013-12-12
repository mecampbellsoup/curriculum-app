class Organization < ActiveRecord::Base
  attr_accessible :name, :subdomain
  has_many :users
  validates_presence_of :subdomain
  validates_presence_of :name
  validates_uniqueness_of :subdomain

  def invite_by_email(emails)
    emails.split(',').each do |email|
      email.strip!
      unless user = User.find_by_email(email)
         user = users.build(:email => email) 
         user.email_invite
      end
    end
  end


end