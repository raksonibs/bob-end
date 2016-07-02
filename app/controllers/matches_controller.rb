class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :update, :destroy]

  # GET /matches
  def index
    @matches = Match.all

    render json: @matches
  end

  def search
    # some parameter comes into the search
    possible_games = Game.spec_waiting(params[:game_type_id])
    if possible_games.count > 1
      possible_games = possible_games[0..1]
      # if found games, need to create a match with these two games
      @gt = GameType.find(params[:game_type_id])
      matches = Game.where(id: possible_games.map(&:id)).map(&:match).uniq

      if matches.count > 1 
        @match = Match.create({game_type: @gt, unique_id: SecureRandom.hex()})
      else
        @match = matches.first
      end

      possible_games.each{|e| @match.games << e}
      possible_games.each{|e| e.update_attributes({match: @match, status: 'playing'})}
      @match.update_attributes({match_amount: @match.total_amount})
      # updates all relationships, and flag games as playing, and then renders match
      # socket sees match and then emits to all listeners, here is your match, now go to it
      render json: @match
    else
      render json: {status: 428}
    end  
  end

  # GET /matches/1
  def show
    render json: @match
  end

  # POST /matches
  def create
    self.check_rubies(params[:user_id])
    @match = Match.new(match_params)

    if @match.save
      render json: @match, status: :created, location: @match
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /matches/1
  def update
    if @match.update(match_params)
      render json: @match
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  # DELETE /matches/1
  def destroy
    @match.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def match_params
      params.fetch(:match, {})
    end
end
