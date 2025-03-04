require './lib/stat_tracker'

game_path = './data/dummy_games_data.csv'

locations = {
  games: game_path
}

stat_tracker = StatTracker.from_csv(locations)

require 'pry'; binding.pry