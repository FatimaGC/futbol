class Game
  @@instances = []

   attr_reader :game_id,
               :season,
               :season,
               :type,
               :date_time,
               :away_team_id,
               :home_team_id,
               :away_goals,
               :home_goals,
               :venue,
               :venue_link
    
  
  def initialize(row)
    @game_id = row[:game_id].to_i
    @season = row[:season].to_i
    @type = row[:type]
    @date_time = row[:date_time]
    @away_team_id = row[:away_team_id].to_i
    @home_team_id = row[:home_team_id].to_i
    @away_goals = row[:away_goals].to_i
    @home_goals = row[:home_goals].to_i
    @venue = row[:venue]
    @venue_link = row[:venue_link]
    # require 'pry'; binding.pry
    @@instances << self
  end

  def self.all_instances
    @@instances # Return the array of instances
  end

  def self.highest_total_score
    total_score.max
  end

  def self.lowest_total_score
    total_score.min
  end

  def self.percentage_home_wins
    home_wins = @@instances.filter_map {|game| game.home_goals > game.away_goals}.count
    percentage(home_wins)
  end

  def self.percentage_visitor_wins
    visitor_wins = @@instances.filter_map {|game| game.home_goals < game.away_goals}.count
    percentage(visitor_wins)
  end

  def self.percentage_ties
    ties = @@instances.filter_map {|game| game.home_goals == game.away_goals}.count
    percentage(ties)
  end

  def self.count_of_games_by_season
    #Create an empty hash
    season_hash = {}

    # #Map through the data to create a new array with unique season numbers.
    # unique_seasons = @@instances.map(&:season).uniq #Creates [20172018, 20122013]
    
    # #Iterate through the array above and add each season number as a key in the hash. 
    # unique_seasons.each do |season|
    #   season_hash[season] = 0
    # end
    # require 'pry'; binding.pry
    # p season_hash

    #REFACTOR 
    @@instances.each do |game|
      season = game.season

      if season_hash.key?(season)
        season_hash[season] += 1
      else 
        season_hash[season] = 1
      end
    end

    season_hash
  end


  private #used to separate helper methods that should only be accessed within the Class. 

  def self.total_score
    @total_score ||= @@instances.map {|game| game.away_goals + game.home_goals}
  end


  def self.percentage(win_count)
    ((win_count.to_f / @@instances.length) * 100).round(2)
  end
end