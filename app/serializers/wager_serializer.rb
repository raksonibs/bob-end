class WagerSerializer < ActiveModel::Serializer
  attributes :id, :amount, :amount_fixed

  belongs_to :game
  belongs_to :user

  def amount_fixed
    object.amount.to_f
  end
end
