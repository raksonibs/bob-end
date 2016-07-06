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
    binding.pry
    puts "SEARCHING FOR GAME"    
    match_with_game = @game.match
    if match_with_game
      binding.pry
      match_with_game.update_attributes(current_turn: possible_games.first.user.id) if match_with_game.current_turn.nil?
      render json: match_with_game
    else
      possible_games = Game.spec_waiting(@game.game_type_id)
      # playing_games = Game.spec_playing(@game.game_type_id)
      binding.pry
      if possible_games.count >= 2
        possible_games = possible_games[0..1]
        # if found games, need to create a match with these two games
        @gt = GameType.find(@game.game_type_id)
        matches = Game.where(id: possible_games.map(&:id)).map(&:match).uniq.compact

        if matches.count == 1 
          @match = matches.first
        else
          @match = Match.create({current_turn: possible_games.first.user.id, game_type: @gt, unique_id: SecureRandom.hex()})
        end
   
        possible_games.each{|e| e.update_attributes({match: @match, status: 'playing'})}
        possible_games.each{|e| @match.games << e}
        
        @match.update_attributes({match_amount: @match.total_amount})
        # updates all relationships, and flag games as playing, and then renders match
        # socket sees match and then emits to all listeners, here is your match, now go to it
        render json: @match
      elsif possible_games.count == 1 
        # needs to join this game!
        binding.pry
      else
        puts "NO GAME FOUND"
        render json: {status: 428}
      end
    end
    render json: @game
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
      @game = Game.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end

    def wager_params(passed)
      ActiveModelSerializers::Deserialization.jsonapi_parse(passed)
    end
end
