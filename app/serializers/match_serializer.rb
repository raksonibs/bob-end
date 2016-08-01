class MatchSerializer < ActiveModel::Serializer
  attributes :id, :match_amount, :unique_id, :current_turn, :next_turn, :amount, :cturn, :nturn

  has_many :outcomes
  belongs_to :game_type
  has_many :games
  has_many :users, through: :games
  has_one :mover, include_nested_associations: true

  # def next_turn
  #   object.games.map(&:user).reject{|e| e.id == object.current_turn }.last.id
  # end

  def amount
    object.match_amount
  end

  def nturn
    object.next_turn
  end

  def cturn
    object.current_turn
  end
end
