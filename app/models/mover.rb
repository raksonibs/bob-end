class Mover < ApplicationRecord
  belongs_to :game_type
  belongs_to :match 
  has_many :moves

  after_create :check_moves

  def reset_choices
    moves.each{|e| e.update_attributes(choices: [])}
  end

  def check_moves
    match = self.match 
    if self.moves.blank?
      match.users.each do |user| 
        self.moves << Move.create(mover: self, user: user)
      end
    end
  end
end
