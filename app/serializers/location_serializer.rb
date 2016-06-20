class LocationSerializer < ActiveModel::Serializer
  attributes :id, :address, :latitude, :longitude, :country, :continent
  has_many :articles
end
