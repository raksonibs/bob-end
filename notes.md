- user has many games
  - user authenticates via github
- games belong to user
  - games where you face another user
  - and bet money on yourself
  - right now game will be tic tac toe in js/ember

- there are many games
  - sti pattern for many games
- there are many played games, which belong to user and game
  - a played game has many bets
  - there are min and max bets
  - win, loss

- user has many rubies (which are dollar equivalencies)
- user connects with another player via socket connection, on connection, join game broadcast
- with rubies can cash out, or can buy at store (more games, or skins on tictactoe (ie: blue x's etc, powermove))
- matchmaking when looking for match roller
- matches become played games, matches connects two players

- four games, tic tac toe, connectfour, rock paper scissors, and sticks
- each game allows to players, connected via socket, 
- eeach game actually is a type of with different attritubes
- you broadcast the moves over the socket
- each player can wager on themselves in the beginning
- during the matchmaking, they set a bet on  themselves first
- a matchmaking process happens (ie: random for now)
  - we record win and losses, and determine someone with equal win and loss rate
