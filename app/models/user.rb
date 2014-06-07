class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true, length: {maximum: 25}
  validates :email, presence: true
  validates :password, length: { minimum: 8}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  before_save { email.downcase! }
  before_create :create_remember_token

  has_many :messages
  has_many :friendships
  has_many :friends, through: :friendships

  def User.default_scope
    where(blocked: false)
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def friends_with?(user)
    friends.include?(user)
  end

  def befriend(friend)
    transaction do
      self.friendships.create(friend_id: friend.id)
      friend.friendships.create(friend_id: self.id)
    end
  end

  def breakup_with(friend)
    transaction do
      self.friendships.where(friend_id: friend.id).first.destroy
      friend.friendships.where(friend_id: self.id).first.destroy
    end
  end

  def ban(user)
    self.blocked = true
    self.blocked_by = user.id
    self.save(validate: false)
  end

  def blocked?
    blocked
  end

  def unban
    self.blocked = false
    self.blocked_by = nil
    self.save(validate: false)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
