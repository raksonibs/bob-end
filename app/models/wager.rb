class Wager < ApplicationRecord
  belongs_to :wagable, polymorphic: true
  belongs_to :user
  belongs_to :match
end
