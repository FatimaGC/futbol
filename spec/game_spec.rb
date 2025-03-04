require 'rspec'
require './lib/game.rb'
require './lib/stat_tracker'


RSpec.describe Game do
  # let!(:game) {
  #   Game.new(2012030221, 20122013, "Postseason", 5/16/13, 3,6,2,3, "Toyota Stadium","/api/v1/venues/null")
  # }

  before(:all) do 
    game_path = './data/dummy_games_data.csv'

    locations = {
        games: game_path
    }
    
    StatTracker.from_csv(locations)

    @game = Game.all_instances.first 
  end 

  describe '#initialize' do
    it 'is an instance of the Game class' do
      expect(@game).to be_instance_of Game
    end
  
    
    xit 'has attributes of game_id, season, season_type, date_time, away_team_id, home_team_id, away_goals, home_goals, venue, venue_link' do
      expect(@game.game_id).to eq(2012030221)
      expect(@game.season).to eq(20122013)
      expect(@game.season_type).to eq("Postseason")
      expect(@game.date_time).to eq(5/16/13)
      expect(@game.away_team_id).to eq(3)
      expect(@game.home_team_id).to eq(6)
      expect(@game.away_goals).to eq(2)
      expect(@game.home_goals).to eq(3)
      expect(@game.venue).to eq("Toyota Stadium")
      expect(@game.venue_link).to eq("/api/v1/venues/null")
    end
  end

  describe '::all_instances' do
    it 'returns an array of game objects' do
      #game = Game.new(2012030221, 20122013, "Postseason", 5/16/13, 3,6,2,3, "Toyota Stadium","/api/v1/venues/null")

      expect(Game.all_instances.count).to eq 84
    end
  end

  xdescribe '#highest total score' do
    it 'returns the highest total score of a game' do
      #Out of each game/row, which game has the highest total score?
      #Create a new empty array
        #total_scores = []
      #Add away_goals + home_goals for each game
      #Push that number into the total_scores array
      #Return the highest score

      #Iterate through all Game objects 
    end
  end
end