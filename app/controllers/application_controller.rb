require 'redis'

class ApplicationController < ActionController::API
  def redis
    redis = Redis.new
  end

  def find_match(params, game = false)
    game_type_id = params[:game_type_id] || game.try(:game_type_id)
    puts "SEARCHING FOR GAME"    
    match_with_game = Game.find_by_id(params[:game_id]).try(:match)
    possible_games = Game.spec_waiting(game_type_id)
    # possible_games = Game.where(game_type_id: game_type_id)

    if match_with_game
      # match_with_game.update_attributes(current_turn: match_with_game.users.first.id) if match_with_game.current_turn.nil?
      match_with_game.make_sure_turns_set
      render json: game || match_with_game
    else
      # playing_games = Game.spec_playing(game_type_id)
      if possible_games.count >= 2
        possible_games = possible_games[0..1]
        # if found games, need to create a match with these two games
        @gt = GameType.find(game_type_id)
        matches = Game.where(id: possible_games.map(&:id)).map(&:match).uniq.compact

        if matches.count == 1 || matches.count == 2
          @match = matches.first
        else
          @match = Match.create({current_turn: possible_games.first.user.id, game_type: @gt, unique_id: SecureRandom.hex()})
        end
   
        possible_games.each{|e| e.update_attributes({match: @match, status: 'playing'})}
        possible_games.each{|e| @match.games << e}
        
        @match.update_attributes({match_amount: @match.total_amount})
        @match.create_mover
        @match.make_sure_turns_set
        # updates all relationships, and flag games as playing, and then renders match
        # socket sees match and then emits to all listeners, here is your match, now go to it
        render json: game || @match
      elsif possible_games.count == 1 
        # needs to join this game!        
        puts "NO SECOND GAME FOUND"
        render json: game || {status: 428}
      else        
        puts "NO GAME FOUND"
        render json: game || {status: 428}
      end
    end
  end
end
