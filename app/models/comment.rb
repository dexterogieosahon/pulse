class Comment < ActiveRecord::Base
  belongs_to :message
  belongs_to :user

  validates :user_id, :message_id, :content, presence: true

  def self.default_scope
    order("created_at DESC")
  end
end
