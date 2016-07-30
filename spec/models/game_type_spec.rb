require 'rails_helper'

RSpec.describe GameType, type: :model do
  let(:game_type) { create(:game_type) }
  let(:user_1) { create(:user) }
  let(:user_2) { create(:user) }

  it 'outputs correct name' do 
    expect(game_type.name).to eq(game_type.name)
  end

  it 'associates a game and attributes correctly' do 
    g1 = Game.find_or_create_by({user: user_1, game_type: game_type})
    g1.save(validate: false)
    g2 = Game.find_or_create_by({user: user_2, game_type: game_type})
    g2.save(validate: false)
    expect(g1.game_type_id).to eq(game_type.id)
    expect(g2.game_type_id).to eq(game_type.id)

    g1.wagers << Wager.find_or_create_by({amount: 10.00, user: user_1, game: g1})
    g2.wagers << Wager.find_or_create_by({amount: 10.00, user: user_2, game: g2})
    expect(user_1.wagers.count).to eq(1)
    expect(user_1.wagers.first.amount.to_f).to eq(10.00)

    match1 = Match.find_or_create_by({game_type: game_type, unique_id: SecureRandom.hex()})
    match1.games << g1
    match1.games << g2
    match1.set_match_amount
    expect(match1.games.count).to eq(2)
    expect(match1.match_amount).to eq(20.00)

    g1.update_attributes({match: match1})
    g2.update_attributes({match: match1})
    expect(g1.match).to eq(match1)
    expect(g1.status).to eq('playing')

    match1.make_sure_turns_set
    expect(match1.current_turn).to eq(user_2.id)
    expect(match1.next_turn).to eq(user_1.id)
    expect(match1.users.uniq.count).to eq(2)

    match1.create_mover
    expect(match1.mover.game_type_id).to eq(game_type.id)

    mover = match1.mover 
    expect(mover.moves.count).to eq(2)

    move_1 = mover.moves.first
    move_2 = mover.moves.last
    move_1.update_attributes({choices: ["rock"], option: 'rock'})
    move_2.update_attributes({choices: ["paper"], option: 'paper'})
    expect(move_1.user_id).to eq(user_1.id)
    expect(move_2.user_id).to eq(user_2.id)
    expect(move_1.choices.count).to eq(1)
    expect(move_1.choices).to eq(["rock"])

    outcome = match1.create_outcomes
    expect(outcome).to eq(true)
    expect(g1.status).to eq('completed')
    # winner is user_2
    # we take 10% of 20, so 2
    outcomes = match1.outcomes
    expect(outcomes.map(&:outcome_value).sort).to eq([0, 1])
    expect(outcomes.first.amount_won).to eq(18)
    expect(outcomes.first.amount_taken).to eq(2)
    expect(outcomes.first.percentage_taken).to eq(0.1)

    expect(user_1.readable_amount).to eq(90.0)
    expect(match1.users.first.readable_amount).to eq(108.0)
  end
end
