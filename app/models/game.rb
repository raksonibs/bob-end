class Game < ApplicationRecord
  has_many :wagers
  belongs_to :game_type
  belongs_to :user
  belongs_to :match, validate: false

  accepts_nested_attributes_for :wagers, allow_destroy: true, reject_if: :all_blank
  # attr_accessible :wagers_attributes
end
