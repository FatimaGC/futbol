require 'CSV'

class StatTracker

  def self.from_csv(locations)
#     locations = {
#   games: './data/games.csv'
# }
    CSV.foreach(locations[:games]) do |row|
      p row
    end
  end
end