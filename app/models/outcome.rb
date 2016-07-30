class Outcome < ApplicationRecord
  # 1 is win, 0 draw, -1 is loss
  belongs_to :user
  belongs_to :match
  after_create :change_rubies, :complete_games
  # enum outcome_value: [:win, :loss]

  def change_rubies
    if outcome_value == -1
      # if loss, already lost at the wager time.
      # user.update_attributes({ruby_amount: user.ruby_amount - outcome.match.})
    elsif outcome_value == 1
      user.update_attributes({ruby_amount: (user.ruby_amount.to_f + amount_won.to_f)})
    end
  end

  def complete_games
    match.games.update_all({status: 'completed'})
  end

  def win?
    outcome_value == 1
  end

  def loss?
    outcome_value == -1
  end

  def draw?
    outcome_value == 0
  end
end
