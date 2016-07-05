class Match < ApplicationRecord  
  has_many :games, validate: false
  has_many :outcomes
  belongs_to :game_type
  has_many :users, through: :games
  # has_many :wagers, validate: false
  after_create :set_match_amount
  # after_update :update_current_turn
  # has_one :current_turn, class_name: 'User', foreign_key: 'id'

  def set_match_amount
    update_attributes(match_amount: games.map(&:wagers).flatten.map(&:amount).inject(&:+))
  end

  def create_outcomes(params)
    outcomes_created = false;
    if outcomes.blank? && params.present?
      winner = User.find_by_id(params[:user_id])
      usersRef = self.users

      usersRef.each_with_index do |user, index|
        
         Outcome.find_or_create_by({
                                match: self, 
                                user: usersRef[0], 
                                outcome_value: winner.id == usersRef[0].id ? 1 : 0, 
                                amount_won: self.match_amount * 0.8, 
                                amount_taken: (self.match_amount - self.match_amount * 0.8), 
                                percentage_taken: 0.2
                              })


      end

      outcomes_created = true
    end

    return outcomes_created
  end

  def update_next_turn
    turn = if next_turn.nil?
      games.map(&:user).reject{|e| e.id == current_turn }.last.id
    else
      next_turn
    end
    tmp = current_turn
    # self.current_turn = turn
    # self.next_turn = current_turn
    # self.save
    update_attributes(current_turn: turn, next_turn: tmp)
  end

  def get_next_turn
    games.map(&:user).reject{|e| e.id == current_turn }.last.id
  end

  def total_amount
    games.map(&:wagers).flatten.map(&:amount).inject(&:+)
  end
end
