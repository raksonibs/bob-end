class WagersController < ApplicationController
  before_action :set_wager, only: [:show, :update, :destroy]

  # GET /wagers
  def index
    @wagers = Wager.all

    render json: @wagers
  end

  # GET /wagers/1
  def show
    render json: @wager
  end

  # POST /wagers
  def create
    @wager = Wager.new(wager_params)

    if @wager.save
      render json: @wager, status: :created, location: @wager
    else
      render json: @wager.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wagers/1
  def update
    if @wager.update(wager_params)
      render json: @wager
    else
      render json: @wager.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wagers/1
  def destroy
    @wager.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wager
      @wager = Wager.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def wager_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
