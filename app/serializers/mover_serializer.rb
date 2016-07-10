class MoverSerializer < ActiveModel::Serializer
  attributes :id, :formatted, :last_move, :last_formatted_move
  
  belongs_to :game_type
  belongs_to :match

  has_many :moves

  def formatted
    object.formatted_moves
  end

  def last_move
    object.moves.order('updated_at DESC').first.nil? ? [] : object.moves.order('updated_at DESC').first
  end

  def last_formatted_move
     object.moves.order('updated_at DESC').first.nil? ? [] : Mover.format_move(object.moves.order('updated_at DESC').first)
  end
end
