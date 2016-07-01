class Outcome < ApplicationRecord
  # 1 is win, 0 draw, -1 is loss
  belongs_to :user
  belongs_to :match

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
