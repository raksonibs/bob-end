class MoveSerializer < ActiveModel::Serializer
  attributes :id, :choices, :option

  belongs_to :mover
  belongs_to :user
end
