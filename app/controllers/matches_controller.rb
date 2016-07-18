class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :update, :destroy]
  before_action :set_matches, only: [:index]
  # GET /matches
  def index
    render json: @matches
  end

  def winner
    @match = Match.find_by_unique_id(params[:id])
    if @match.create_outcomes(params)
      render json: @match
    else
      render json: {status: 428}
    end
  end

  def search
    # some parameter comes into the search
    # need to pass what game this is in in the socket connection 
    # to see if there are any matches already with this game id in it
    find_match(params)
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

  def record_move
    user = User.find_by_id(params[:user])
    match = Match.find_by_unique_id(params[:id])
    @mover = match.mover
    @mover.check_moves
    choice = params[:choice]
    choice = choice.split(',') if choice =~ /,/

    if match
      match.record_move(user, choice)

      render json: @mover
    else
      render json: {status: 428}
    end
  end

  def moves
    match = Match.find_by_unique_id(params[:id])
    @mover = match.mover
    if match
      render json: @mover
    else
      render json: {status: 428}
    end
  end

  # PATCH/PUT /matches/1
  def update
    if @match.update(match_params)  
      @match.update_next_turn
      # @match.update_attributes(current_turn: params[:data][:attributes]["current-turn"] )if params[:data][:attributes]["current-turn"]
      # @match.update_attributes(current_turn: @match.get_next_turn ) if params[:data][:attributes]["current-turn"]
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
      @match = Match.find_by_id(params[:id]) || Match.find_by_unique_id(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def match_params
      params.fetch(:match, {})
    end

    def set_matches
      if current_user
        @matches = Match.where(user_id: current_user.id)
      else
        @matches = Match.all
      end
    end
end
