require 'rspec'
require './lib/stat_tracker.rb'

RSpec.describe StatTracker do

  let(:stat_tracker) {
    StatTracker.new(2012030221, 20122013, "Postseason", 5/16/13, 3,6,2,3, "Toyota Stadium","/api/v1/venues/null")
  }
  
  describe '#initialize' do
    it 'is an instance of the StatTracker class' do
      expect(stat_tracker).to be_instance_of StatTracker
    end
  
    
    it 'has attributes of game_id, season, season_type, date_time, away_team_id, home_team_id, away_goals, home_goals, venue, venue_link' do
      expect(stat_tracker.game_id).to eq(2012030221)
      expect(stat_tracker.season).to eq(20122013)
      expect(stat_tracker.season_type).to eq("Postseason")
      expect(stat_tracker.date_time).to eq(5/16/13)
      expect(stat_tracker.away_team_id).to eq(3)
      expect(stat_tracker.home_team_id).to eq(6)
      expect(stat_tracker.away_goals).to eq(2)
      expect(stat_tracker.home_goals).to eq(3)
      expect(stat_tracker.venue).to eq("Toyota Stadium")
      expect(stat_tracker.venue_link).to eq("/api/v1/venues/null")
    end
  end
end
  