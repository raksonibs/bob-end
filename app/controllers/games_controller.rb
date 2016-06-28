class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update, :destroy]

  # GET /games
  def index
    @games = {data: [
              {
                id: '1', 
                type: 'games',
                attributes: {
                  name: 'Tic Tac Toe', 
                  num_players: 2
                }
              },
              {
                id: '2', 
                type: 'games',
                attributes: {
                  name: 'Connect Four', 
                  num_players: 2
                }
              },
              {
                id: '3', 
                type: 'games',
                attributes: {
                  name: 'Rock Paper Scissors', 
                  num_players: 2
                }
              },
              {
                id: '4', 
                type: 'games',
                attributes: {
                  name: 'Stix', 
                  num_players: 2
                }
              }
          ]
      }

    render json: @games
  end

  # GET /games/1
  def show
    render json: @game
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    if @game.save
      render json: @game, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_params
      params.fetch(:game, {})
    end
end
