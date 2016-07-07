class Move < ApplicationRecord
  belongs_to :mover
  belongs_to :user
  default_scope { order('created_at DESC') }
end
