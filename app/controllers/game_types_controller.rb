class GameTypesController < ApplicationController
  before_action :set_game_type, only: [:show, :update, :destroy]

  # GET /game_types
  def index
    @game_types = GameType.all

    render json: @game_types
  end

  # GET /game_types/1
  def show
    render json: @game_type
  end

  # POST /game_types
  def create
    @game_type = GameType.new(game_type_params)

    if @game_type.save
      render json: @game_type, status: :created, location: @game_type
    else
      render json: @game_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /game_types/1
  def update
    if @game_type.update(game_type_params)
      render json: @game_type
    else
      render json: @game_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /game_types/1
  def destroy
    @game_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_type
      @game_type = GameType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_type_params
      params.fetch(:game_type, {})
    end
end
