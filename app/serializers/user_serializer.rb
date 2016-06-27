class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  
  has_many :played_games
  # has_many :matches
  has_many :wagers

end
