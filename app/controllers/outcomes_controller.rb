class OutcomesController < ApplicationController
  before_action :set_outcome, only: [:show, :update, :destroy]

  # GET /outcomes
  def index
    @outcomes = Outcome.all

    render json: @outcomes
  end

  # GET /outcomes/1
  def show
    render json: @outcome
  end

  # POST /outcomes
  def create
    @outcome = Outcome.new(outcome_params)

    if @outcome.save
      render json: @outcome, status: :created, location: @outcome
    else
      render json: @outcome.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /outcomes/1
  def update
    if @outcome.update(outcome_params)
      render json: @outcome
    else
      render json: @outcome.errors, status: :unprocessable_entity
    end
  end

  # DELETE /outcomes/1
  def destroy
    @outcome.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outcome
      @outcome = Outcome.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def outcome_params
      params.fetch(:outcome, {})
    end
end
