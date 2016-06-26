class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  
  has_many :played_games
  has_many :moneys

end
