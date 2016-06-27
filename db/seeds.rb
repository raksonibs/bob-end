u1 = User.find_or_create_by({email: "oskar@gmail.com", password: 'test', password_confirmation: 'test'})
u2 = User.find_or_create_by({email: "kacper@gmail.com", password: 'test', password_confirmation: 'test'})
u3 = User.find_or_create_by({email: "claire@gmail.com", password: 'test', password_confirmation: 'test'})

g1 = Game.find_or_create_by({type: 'TicTacToe', num_players: 2, name: 'Tic Tac Toe'})
match1 = Match.find_or_create_by(game: g1)
wager1 = Wager.find_or_create_by({user: u1, amount: 10, match: match1})
wager2 = Wager.find_or_create_by({user: u2, amount: 10, match: match1})
match1.wagers << wager1
match1.wagers << wager2
# outcome o is a loss for one player,
# outcome 1 is a win for player
played_game1 = PlayedGame.find_or_create_by(game: g1, user: u1, outcome: 0, match: match1)
played_game2 = PlayedGame.find_or_create_by(game: g1, user: u2, outcome: 0, match: match1)





