class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all.includes(:favourites)

    render json: @users
  end

  def me    
    render json: current_user
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def token
    user = User.find_by_email(params[:username])

    if user && user.authenticate(params[:password])
      render json: {user: user, access_token: Rails.application.secrets.access_token}
    else
      render json: { error: 'Application specific message' }, status: :bad_request
    end 
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params      
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
