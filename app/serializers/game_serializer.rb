class GameSerializer < ActiveModel::Serializer
  attributes :id, :status, :total

  belongs_to :user
  belongs_to :game_type
  belongs_to :match
  has_many :wagers, serializer: WagerSerializer

  def total
    object.wagers.map(&:amount).map(&:to_f).inject(&:+)
  end
end
