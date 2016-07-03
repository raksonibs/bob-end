class Match < ApplicationRecord  
  has_many :games, validate: false
  has_many :outcomes
  belongs_to :game_type
  # has_many :wagers, validate: false
  after_create :set_match_amount
  # after_update :update_current_turn
  # has_one :current_turn, class_name: 'User', foreign_key: 'id'

  def set_match_amount
    update_attributes(match_amount: games.map(&:wagers).flatten.map(&:amount).inject(&:+))
  end

  def update_next_turn
    turn = if next_turn.nil?
      games.map(&:user).reject{|e| e.id == current_turn }.last.id
    else
      next_turn
    end
    tmp = current_turn
    # self.current_turn = turn
    # self.next_turn = current_turn
    # self.save
    update_attributes(current_turn: turn, next_turn: tmp)
  end

  def get_next_turn
    games.map(&:user).reject{|e| e.id == current_turn }.last.id
  end

  def total_amount
    games.map(&:wagers).flatten.map(&:amount).inject(&:+)
  end
end
