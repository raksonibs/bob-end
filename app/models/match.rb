class Match < ApplicationRecord
  has_many :users
  belongs_to :game
end
