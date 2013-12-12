class Organization < ActiveRecord::Base
  attr_accessible :name, :subdomain

  has_many :users, :dependent => :destroy
  has_many :issues, :dependent => :destroy

  accepts_nested_attributes_for :users

  validates_uniqueness_of :subdomain

end
