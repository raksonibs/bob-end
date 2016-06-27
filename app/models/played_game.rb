class PlayedGame < ApplicationRecord
  belongs_to :user
  belongs_to :game, foreign_key: :game_id
  has_many :wagers, as: :wagable
  after_create :calculate_total_bet
  belongs_to :match

  def calculate_total_bet
    update_attributes(total_bet: wagers.map(&:amount))
  end
end
