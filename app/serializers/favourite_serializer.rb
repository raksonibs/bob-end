class FavouriteSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :article
end
