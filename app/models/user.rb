class User < ApplicationRecord
  has_secure_password
  has_many :favourites
  has_many :articles, through: :favourites
  has_many :played_games
  belongs_to :match

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest) == password
  end
end
