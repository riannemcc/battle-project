require './lib/game.rb'

describe Game do
  subject(:game) { described_class.new(player_1, player_2) }
  let(:player_1) { double :player }
  let(:player_2) { double :player }

   it 'accepts two player instances' do
     expect(game.player_1).to eq player_1
   end

  describe "#attack" do
   it "damages the player" do
     expect(player_2).to receive(:hit)
     game.attack(player_2)
   end
  end

  describe '#current_turn' do
    it 'starts as player 1' do
      expect(game.current_turn).to eq player_1
    end
  end

  describe '#switch_turns' do
    it 'switches the turn' do
      game.switch_turns
      expect(game.current_turn).to eq player_2
    end
  end 
end
