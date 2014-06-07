class Friendship < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :friend, class_name: "User"

  validates_presence_of :user_id, :friend_id
  
end
