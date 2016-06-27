class PlayedGamesController < ApplicationController
  before_action :set_played_game, only: [:show, :update, :destroy]

  # GET /played_games
  def index
    @played_games = PlayedGame.all

    render json: @played_games
  end

  # GET /played_games/1
  def show
    render json: @played_game
  end

  # POST /played_games
  def create
    @played_game = PlayedGame.new(played_game_params)

    if @played_game.save
      render json: @played_game, status: :created, location: @played_game
    else
      render json: @played_game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /played_games/1
  def update
    if @played_game.update(played_game_params)
      render json: @played_game
    else
      render json: @played_game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /played_games/1
  def destroy
    @played_game.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_played_game
      @played_game = PlayedGame.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def played_game_params
      params.fetch(:played_game, {})
    end
end
