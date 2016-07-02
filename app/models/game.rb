class Game < ApplicationRecord
  # status can be waiting, or completed, or dropped, or playing
  has_many :wagers
  belongs_to :game_type
  belongs_to :user
  belongs_to :match, validate: false

  accepts_nested_attributes_for :wagers, allow_destroy: true, reject_if: :all_blank
  # attr_accessible :wagers_attributes

  scope :waiting, -> { where(status: 'waiting')}
  scope :spec_waiting, -> (game_type_id){where(status: 'waiting', game_type_id: game_type_id.to_i)}
  scope :spec_waiting, -> (game_type_id){where(status: 'playing', game_type_id: game_type_id.to_i)}
  scope :completed, -> { where(status: 'completed')}
end
