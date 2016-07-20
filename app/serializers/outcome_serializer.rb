class OutcomeSerializer < ActiveModel::Serializer
  attributes :id, :amount_won, :amount_take, :percentage_taken, :created_at

  belongs_to :user
  belongs_to :match
end
