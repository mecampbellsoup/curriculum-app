class Comment < ActiveRecord::Base
  attr_accessible :body, :email, :post_id
  belongs_to :post
end
