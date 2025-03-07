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
    total_scores = all_instances.map {|game| game.away_goals + game.home_goals}.max
  end

  def self.lowest_total_score
    total_scores = all_instances.map {|game| game.away_goals + game.home_goals}.min #functionality is the same as the method above. Make this a module?
  end

  def self.percentage_home_wins
    home_wins = all_instances.filter_map {|game| game.home_goals > game.away_goals}.count
    percent_wins = ((home_wins.to_f / all_instances.length) * 100).round(2)
  end

  def self.percentage_visitor_wins
    visitor_wins = all_instances.filter_map {|game| game.home_goals < game.away_goals}.count
    percent_wins = ((visitor_wins.to_f / all_instances.length) * 100).round(2)
  end

  def self.percentage_ties
    require 'pry'; binding.pry
    ties = all_instances.filter_map {|game| game.home_goals == game.away_goals}.count
    percent_ties = ((ties.to_f / all_instances.length) * 100).round(2)
  end
end