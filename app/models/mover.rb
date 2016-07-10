class Mover < ApplicationRecord
  belongs_to :game_type
  belongs_to :match 
  has_many :moves

  after_create :check_moves

  def reset_choices
    moves.each{|e| e.update_attributes(choices: [])}
  end

  def self.matrix
    matrix = {
      1 => {
        1 => "",
        2 => "",
        3 => ""
      },  
      2 => {
        1 => "",
        2 => "",
        3 => ""
      }, 
      3 => {
        1 => "",
        2 => "",
        3 => ""
      }
    }
  end

  def formatted_moves
    # x is user 1, 
    # o is user 2
    # matrix = Mover.matrix if game_type_id == 1
    formatted = []
    moves.each_with_index do |move, index|
      choices = move.choices
      choices.each do |choice|
        if game_type_id == 2
          formatted << [index.even? ? move.user_id : move.user_id, index.even? ? "X" : "O", choice[0], choice[1] ]
         elsif game_type_id == 3
          formatted << [index.even? ? move.user_id : move.user_id, "", choice[0], choice[1] ]
        else
          formatted << [index.even? ? move.user_id : move.user_id, "", choice[0], "" ]
        end
      end
    end

    formatted
  end

  def self.format_move(move)
    game_type = move.mover.game_type_id
    user_id = move.user_id
    index = move.mover.moves.find_index(move)
    choice = move.choices.last

    unless choice.nil?
      if game_type == 2
        [index.even? ? move.user_id : move.user_id, index.even? ? "X" : "O", choice[0], choice[1] ]
      elsif game_type == 3
        [index.even? ? move.user_id : move.user_id, "", choice[0], choice[1] ]
      else
        [index.even? ? move.user_id : move.user_id, "", choice[0], "" ]
      end
    else
      []
    end
  end

  def check_moves
    match = self.match

    if self.moves.blank?
      users = Game.where(match_id: match.id).map(&:user)
      users.each do |user| 
        self.moves << Move.create(mover: self, user: user)
      end
    end
  end
end
