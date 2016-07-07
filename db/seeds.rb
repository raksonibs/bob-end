puts "SEEDING"
gt1 = GameType.find_or_create_by({name: 'Rock Paper Scissors', num_players: 2})
gt2 = GameType.find_or_create_by({name: 'Connect Four', num_players: 2})
gt3 = GameType.find_or_create_by({name: 'Stix', num_players: 2})
gt3 = GameType.find_or_create_by({name: 'Tic Tac Toe', num_players: 2})

u1 = User.find_or_create_by({email: "oskar@gmail.com", password: 'test', password_confirmation: 'test'})
u2 = User.find_or_create_by({email: "kacper@gmail.com", password: 'test', password_confirmation: 'test'})
u3 = User.find_or_create_by({email: "claire@gmail.com", password: 'test', password_confirmation: 'test'})

g1 = Game.find_or_create_by({user: u1, game_type: gt1})
g1.save(validate: false)
g2 = Game.find_or_create_by({user: u2, game_type: gt1})
g2.save(validate: false)
u1.games << g1
u2.games << g2
g1.wagers << Wager.find_or_create_by({amount: 10.00, user: u1, game: g1})
g2.wagers << Wager.find_or_create_by({amount: 10.00, user: u2, game: g2})

match1 = Match.find_or_create_by({game_type: gt1, unique_id: SecureRandom.hex()})
match1.games << g1
match1.games << g2
match1.update_attributes({match_amount: match1.total_amount})


g1.update_attributes({match: match1})
g2.update_attributes({match: match1})
# kacper lost to oskar

match1.create_mover

match1.mover.moves.each_with_index do |move, index|
  if index.even?
    move.update_attributes({choices: ["rock"], option: 'rock'})
  else
    move.update_attributes({choices: ["paper"], option: 'paper'})
  end
end

outcome1 = Outcome.find_or_create_by({match: match1, user: u1, outcome_value: 1, amount_won: 18.00, amount_taken: 2.00, percentage_taken: 0.1})
outcome2 = Outcome.find_or_create_by({match: match1, user: u2, outcome_value: 0, amount_won: 0, amount_taken: 2.00, percentage_taken: 0.1})

