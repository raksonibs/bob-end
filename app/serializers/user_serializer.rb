class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :ruby_amount

  has_many :games
  has_many :wagers, through: :games
  has_many :outcomes
end
