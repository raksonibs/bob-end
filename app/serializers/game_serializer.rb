class GameSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :played_games
end
