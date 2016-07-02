class GameSerializer < ActiveModel::Serializer
  attributes :id

  has_many :wagers, serializer: WagerSerializer
  belongs_to :user
  belongs_to :game_type
  belongs_to :match

  class WagerSerializer < ActiveModel::Serializer
    attributes :id, :amount_fixed

    def amount_fixed
      object.amount.to_f
    end
  end
end
