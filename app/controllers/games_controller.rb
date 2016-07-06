class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update, :destroy]

  # GET /games
  def index
    @games = Game.all.includes(:wagers)

    render json: @games
  end

  # GET /games/1
  def show
    # rendering show but not transitioning to matchmaking search first!    
    find_match(params, @game)
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    if @game.save(validate: false)
      # @game.update_attributes({game_type: GameType.find(params[:data][:attributes][:possible])})
      # NTD: Post request with nested attributes, how?
      # also the validate false for now, there should be a container fill instead.
      if params[:data][:wagers]
        params[:data][:wagers].each do |wager|
          @wager = Wager.new(wager_params(wager))
          @wager.game = @game
          @wager.save
          @game.wagers << @wager
        end
        @game.save
      end
      
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
      @game = Game.find_by_id(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end

    def wager_params(passed)
      ActiveModelSerializers::Deserialization.jsonapi_parse(passed)
    end
end
