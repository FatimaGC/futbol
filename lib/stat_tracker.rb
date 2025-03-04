require 'CSV'
require_relative './game.rb'

class StatTracker

  def self.from_csv(locations)
#     locations = {
#   games: './data/games.csv'
# }
    CSV.foreach(locations[:games], headers: true, header_converters: :symbol) do |row|
      # require 'pry'; binding.pry
      Game.new(row)
    end
  end
end