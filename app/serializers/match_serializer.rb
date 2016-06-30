class MatchSerializer < ActiveModel::Serializer
  attributes :id, :game_type

  has_many :wagers
  has_many :played_games
  belongs_to :game

  def game_type
    match.game
  end

end
