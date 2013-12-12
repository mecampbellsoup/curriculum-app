class UserGroup < ActiveRecord::Base
  attr_accessible :title, :body, :user_id, :group_id
  belongs_to :user
  belongs_to :group
end
