require_relative "team"

def game_info
   [
    {
      home_team: "Patriots",
      away_team: "Broncos",
      home_score: 7,
      away_score: 3
    },
    {
      home_team: "Broncos",
      away_team: "Colts",
      home_score: 3,
      away_score: 0
    },
    {
      home_team: "Patriots",
      away_team: "Colts",
      home_score: 11,
      away_score: 7
    },
    {
      home_team: "Steelers",
      away_team: "Patriots",
      home_score: 7,
      away_score: 21
    }
  ]
end

# YOUR CODE HERE

league = {}

def get_names (games, league)
  games.each do |game|
    home_team = game[:home_team]
    away_team = game[:away_team]
    league[home_team.to_sym] = Team.new(home_team) unless league.keys.include?(home_team.to_sym)
    league[away_team.to_sym] = Team.new(away_team) unless league.keys.include?(away_team.to_sym)
  end
end

def tally_scores (games, league)
  games.each do |game|
    home_team = game[:home_team]
    away_team = game[:away_team]
    home_score = game[:home_score]
    away_score = game[:away_score]
    if home_score > away_score
      league[home_team.to_sym].wins += 1
      league[away_team.to_sym].losses += 1
    else
      league[home_team.to_sym].losses += 1
      league[away_team.to_sym].wins += 1
    end
    league[home_team.to_sym].games << game
    league[away_team.to_sym].games << game
  end
end

def rank_teams (league)
  teams = []
  league.each do |name, team|
    teams << team
  end
  current_rank = 1
  while teams.empty? != true do
    current_max_wins = 0
    current_team_name = ""
    current_team = nil
    teams.each do |team|
      if team.wins >= current_max_wins
        current_max_wins = team.wins
        current_team_name = team.name
        current_team = team
      end
    end
    league[current_team_name.to_sym].rank = current_rank
    current_rank += 1
    teams.delete(current_team)
  end
end

def print_border
  border_output = ""
  50.times {border_output << '-'}
  border_output << "\n"
  return border_output
end

def leaderboard (league)
  leaderboard_output = ""
  current_rank = 1
  leaderboard_output << print_border()
  leaderboard_output << "| Name     Rank     Total Wins     Total Losses\n"
  while current_rank <= league.size do
    league.each do |name, team|
      leaderboard_output << "| #{team.name}" + "#{current_rank.to_s.rjust(10 - team.name.length)} #{team.wins.to_s.rjust(8)} #{team.losses.to_s.rjust(14)}\n" if team.rank == current_rank
    end
    current_rank += 1
  end
  leaderboard_output << print_border()
  leaderboard_output << "\n"
  return leaderboard_output
end

def league_summary (league)
  league_summary_output = ""
  league.each do |name, team|
    league_summary_output << team.summary
    league_summary_output << "\n"
  end
  return league_summary_output
end

#main program
get_names(game_info, league)
tally_scores(game_info, league)
rank_teams(league)
puts leaderboard(league)
puts league_summary(league)
