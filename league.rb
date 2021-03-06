class League

  attr_accessor :reader, :teams

  def initialize (name)
    @name = name
    @teams = {}
  end

  def add_teams (games)
    games.each do |game|
      home_team = game[:home_team]
      away_team = game[:away_team]
      teams[home_team.downcase.to_sym] = Team.new(home_team) unless teams.keys.include?(home_team.downcase.to_sym)
      teams[away_team.downcase.to_sym] = Team.new(away_team) unless teams.keys.include?(away_team.downcase.to_sym)
    end
  end

  def parse_games (games)
    games.each do |game|
      this_game = Game.new(game)
      home_team_sym = this_game.home_team.downcase.to_sym
      away_team_sym = this_game.away_team.downcase.to_sym
      if this_game.home_score > this_game.away_score
        teams[home_team_sym].wins += 1
        teams[away_team_sym].losses += 1
      else
        teams[home_team_sym].losses += 1
        teams[away_team_sym].wins += 1
      end
      teams[home_team_sym].games << this_game
      teams[away_team_sym].games << this_game
    end
  end

  def leaderboard()
    calculate_rankings()
    leaderboard_output = ""
    header_name = "| Name        "
    header_rank = "Rank     "
    header_wins = "Total Wins     "
    header_losses = "Total Losses"
    leaderboard_output << print_border()
    leaderboard_output << header_name + header_rank + header_wins + header_losses + "\n"
    current_rank = 1
    while current_rank <= teams.size do
      teams.each do |name, team|
        if team.rank == current_rank
          leaderboard_output << "| #{team.name}"
          leaderboard_output << "#{current_rank.to_s.rjust(header_name.length - team.name.length - current_rank.to_s.length)} "
          leaderboard_output << "#{team.wins.to_s.rjust(header_rank.length - team.wins.to_s.length)} "
          leaderboard_output << "#{team.losses.to_s.rjust(header_wins.length - team.losses.to_s.length)} "
          leaderboard_output << "\n"
          current_rank += 1
          break
        end
      end
    end
    leaderboard_output << print_border()
    return leaderboard_output
  end

  def team_summaries()
    team_summary_output = ""
    teams.each do |name, team|
      team_summary_output << team.summary
      team_summary_output << "\n"
    end
    return team_summary_output
  end

  def league_summary()
    <<SUMMARY
#{leaderboard}
#{team_summaries}
SUMMARY
  end

  private

  def print_border()
    border_output = ""
    50.times {border_output << '-'}
    border_output << "\n"
    return border_output
  end

  def calculate_rankings()
    teams_temp = []
    teams.each do |name, team|
      teams_temp << team
    end
    current_rank = 1
    while teams_temp.empty? != true do
      current_max_wins = 0
      current_team_name = ""
      current_team = nil
      teams_temp.each do |team|
        if team.wins >= current_max_wins
          current_max_wins = team.wins
          current_team_name = team.name.downcase.to_sym
          current_team = team
        end
      end
      teams[current_team_name].rank = current_rank
      current_rank += 1
      teams_temp.delete(current_team)
    end
  end

end
