class Mover < ApplicationRecord
  belongs_to :game_type
  belongs_to :match 
  has_many :moves

  def reset_choices
    moves.each{|e| e.update_attributes(choices: [])}
  end
end
