class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_many :favourites
  has_many :articles, through: :favourites
end
