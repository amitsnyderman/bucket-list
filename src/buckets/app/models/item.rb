class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :bucket
  
  scope :for_user, lambda { |user| where("user_id = ?", user.id) }
end
