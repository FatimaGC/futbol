require 'rspec'
require './lib/game.rb'

RSpec.describe Game do
  let(:game) {
    Game.new(2012030221, 20122013, "Postseason", 5/16/13, 3,6,2,3, "Toyota Stadium","/api/v1/venues/null")
  }

  describe '#initialize' do
    it 'is an instance of the Game class' do
      expect(game).to be_instance_of Game
    end
  
    
    it 'has attributes of game_id, season, season_type, date_time, away_team_id, home_team_id, away_goals, home_goals, venue, venue_link' do
      expect(game.game_id).to eq(2012030221)
      expect(game.season).to eq(20122013)
      expect(game.season_type).to eq("Postseason")
      expect(game.date_time).to eq(5/16/13)
      expect(game.away_team_id).to eq(3)
      expect(game.home_team_id).to eq(6)
      expect(game.away_goals).to eq(2)
      expect(game.home_goals).to eq(3)
      expect(game.venue).to eq("Toyota Stadium")
      expect(game.venue_link).to eq("/api/v1/venues/null")
    end
  end
end