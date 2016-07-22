class User < ApplicationRecord
  has_secure_password
  has_many :favourites
  has_many :articles, through: :favourites
  has_many :games
  has_many :matches, through: :games
  has_many :wagers, through: :games
  has_many :outcomes

  default_scope { order('created_at DESC') }

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def output_email
    email
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest) == password
  end
end
