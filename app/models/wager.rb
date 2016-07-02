class Wager < ApplicationRecord
  belongs_to :game
  # belongs_to :match, validate: false
  belongs_to :user

  after_create :subtract_user_rubies

  def subtract_user_rubies
    user.update_attributes({ruby_amount: user.ruby_amount - amount})
  end
end
