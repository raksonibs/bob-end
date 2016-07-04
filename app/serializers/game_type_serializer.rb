class GameTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :num_players, :slug
end
