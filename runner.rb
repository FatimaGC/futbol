require './lib/stat_tracker'

game_path = './data/games.csv'

locations = {
  games: game_path
}

stat_tracker = StatTracker.from_csv(locations)

require 'pry'; binding.pry