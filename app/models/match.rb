class Match < ApplicationRecord  
  has_many :games, validate: false
  has_many :outcomes, dependent: :destroy
  belongs_to :game_type
  has_many :users, through: :games
  # has_many :wagers, validate: false
  after_create :set_match_amount
  has_one :mover
  # after_update :update_current_turn
  # has_one :current_turn, class_name: 'User', foreign_key: 'id'
  # after_update :make_sure_turns_set

  PERCENT_KEPT = 0.9
  PERCENT_TAKEN = 1 - PERCENT_KEPT

  def set_match_amount
    update_attributes(match_amount: games.map(&:wagers).flatten.map(&:amount).inject(&:+))
    games.each do |game|
      game.status = 'playing'
      game.save(validate: false)
    end
  end

  def make_sure_turns_set
    users = self.users.blank? ? self.games.map(&:user) : self.users
    
    unless users.blank?
      self.update_attributes(current_turn: users[0].id) if current_turn.nil? || current_turn == next_turn
      self.update_attributes(next_turn: users[1].id) if next_turn.nil? || current_turn == next_turn

      if current_turn == next_turn
        turn = current_turn == users[0].id ? users[1].id : users[0].id
        self.update_attributes(next_turn: turn)
      end
    end
  end

  def record_move(user, choice)
    mover = self.mover 
    user_moves = mover.moves.where(user_id: user.id).first
    user_moves.update_attributes({choices: user_moves.choices << choice}) if user_moves
  end

  def create_mover
    self.mover = Mover.find_by_match_id(self.id) || Mover.create(match: self, game_type: self.game_type)
    if self.mover.moves.blank?
      self.users.each do |user| 
        mover.moves << Move.create(mover: self.mover, user: user)
      end
    end
  end

  def create_outcomes(params = nil)
    # right now passing outcome of winner via params, should be double checked and validated here. oh well.

    outcomes_created = false;
    if (outcomes.blank? && params.present?) || (outcomes.blank? && current_turn.present?)
      winner = User.find_by_id(params.try(:[], :user_id)) || User.find_by_id(current_turn)
      usersRef = self.users

      usersRef.each_with_index do |user, index|
        
        outcome = Outcome.find_or_create_by({
                                match: self, 
                                user: user, 
                                outcome_value: winner.id == user.id ? 1 : 0, 
                                amount_won: self.match_amount * PERCENT_KEPT, 
                                amount_taken: (self.match_amount - self.match_amount * PERCENT_KEPT), 
                                percentage_taken: PERCENT_TAKEN
                              })

        self.outcomes << outcome
      end
      
      games.each do |game|
        game.status = 'completed'
        game.save(validate: false)
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
