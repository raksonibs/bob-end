class Wager < ApplicationRecord
  belongs_to :game
  # belongs_to :match, validate: false
  belongs_to :user
end
