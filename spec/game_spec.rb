require 'rspec'
require './lib/game.rb'
require './lib/stat_tracker'


RSpec.describe Game do
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
  
    
    it 'has attributes of game_id, season, season_type, date_time, away_team_id, home_team_id, away_goals, home_goals, venue, venue_link' do
      expect(@game.game_id).to eq(2017030241)
      expect(@game.season).to eq(20172018)
      expect(@game.type).to eq("Postseason")
      expect(@game.date_time).to eq("4/27/18")
      expect(@game.away_team_id).to eq(28)
      expect(@game.home_team_id).to eq(54)
      expect(@game.away_goals).to eq(0)
      expect(@game.home_goals).to eq(5)
      expect(@game.venue).to eq("Cheney Stadium")
      expect(@game.venue_link).to eq("/api/v1/venues/null")
    end
  end

  describe '::all_instances' do
    it 'returns an array of game objects' do
      expect(Game.all_instances.count).to eq 10
    end
  end

  describe '::highest_total_score' do
    it 'returns the highest total score out of all the games' do
      #Out of each game/row, which game has the highest total score?
      #Create a new empty array
        #total_scores = []
      #Add away_goals + home_goals for each game
      #Push that number into the total_scores array
      #Return the highest score

      #Iterate through all Game objects 
      expect(Game.highest_total_score).to eq (7)
    end
  end

  describe '::lowest_total_score' do
    it 'returns the lowest total score out of all the games' do
      expect(Game.lowest_total_score).to eq (2)
    end
  end

  describe '::percentage_home_wins' do
    it 'returns the percentage of games that a home team has won (rounded to the nearest 100th)' do
      #Create a new array that tracks when home goals > away goals 
      #Return the percentage which is the new array length divided by the game instances 
      expect(Game.percentage_home_wins).to eq (60.0)
    end
  end

  describe '::percentage_visitor_wins' do
    it 'returns the percentage of games that a visiting team has won (rounded to the nearest 100th)' do
      expect(Game.percentage_visitor_wins).to eq (30.0)
    end
  end

  describe '::percentage_ties' do
    it 'returns percentage of games that hava resulted in a tie (rounded to the nearest 100th)' do
      expect(Game.percentage_ties).to eq (10.0)
    end
  end

  describe '::count_of_games_by_season' do
    it 'returns a hash with season names (e.g. 20122013) as keys and counts of games as values' do
      
      count_of_games_by_season_hash = {
        20172018 => 9,
        20122013 => 1
        }

      expect(Game.count_of_games_by_season).to eq (count_of_games_by_season_hash)
    end
  end

  describe '::average_goals_per_game' do
    it 'returns the average number of goals scored in a game across all seasons including both home and away goals (rounded to the nearest 100th)' do
      expect(Game.average_goals_per_game).to eq (5)
    end
  end
end