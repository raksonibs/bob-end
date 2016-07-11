class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :ruby_amount, :password, :password_confirmation

  has_many :games
  has_many :matches
  has_many :wagers, through: :games
  has_many :outcomes
end
