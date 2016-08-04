class User < ActiveRecord::Base
  validates :email, :password_digest, :session_token, :activation_token, presence: true
  validates :password, length: { minimum: 8, allow_nil: true }
  after_initialize :ensure_session_token

  has_many :notes

  attr_reader :password

  def password=(pass)
    @password = pass
    self.password_digest = BCrypt::Password.create(pass)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
    self.activation_token ||= SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    save
  end

  def is_password?(pass)
    BCrypt::Password.new(self.password_digest).is_password?(pass)
  end
end
