class MatchSerializer < ActiveModel::Serializer
  attributes :id, :match_amount, :unique_id

  has_many :outcomes
  belongs_to :game_type
  has_many :games
end
