class Wager < ApplicationRecord
  belongs_to :game
  belongs_to :match
  belongs_to :user
end
