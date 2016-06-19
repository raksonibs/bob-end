class LocationSerializer < ActiveModel::Serializer
  attributes :id, :address, :latitude, :longitude
  has_many :articles
end
