class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :ruby_amount, :money, :nummatches, :numwins, :numlosses, :percentage, :moneymade, :moneylost

  has_many :games
  # has_many :matches
  has_many :wagers, through: :games
  has_many :outcomes

  def ruby_amount
    object.ruby_amount.to_f
  end

  def money
    object.ruby_amount
  end

  def moneymade
    sum = 0
    win_outcomes.each{|e| sum += e.amount_won.to_f}
    sum
  end

  def moneylost
    sum = 0
    loss_outcomes.each{|e|sum += e.amount_won.to_f}
    sum
  end

  def win_outcomes
    object.outcomes.where(outcome_value: 1)
  end

  def loss_outcomes
    object.outcomes.where(outcome_value: 0)
  end

  def percentage
    begin
      (win_outcomes.count / (loss_outcomes.count + win_outcomes.count)) * 100
    rescue
      0
    end
  end

  def numwins
    win_outcomes.count
  end

  def numlosses
    loss_outcomes.count
  end

  def nummatches
    Game.where(user_id: object.id).count
  end

end
