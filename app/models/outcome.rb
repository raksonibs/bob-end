class Outcome < ApplicationRecord
  # 1 is win, 0 draw, -1 is loss
  belongs_to :user
  belongs_to :match
  after_create :change_rubies

  def change_rubies
    if outcome_value == -1
      # if loss, already lost at the wager time.
      # user.update_attributes({ruby_amount: user.ruby_amount - outcome.match.})
    elsif outcome_value == 1 
      user.update_attributes({ruby_amount: user.ruby_amount + amount_won})
    end
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
