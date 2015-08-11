require_relative "team"
require_relative "league"
require_relative "game"

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

league_NFL = League.new("NFL")
league_NFL.add_teams(game_info)
league_NFL.parse_games(game_info)
puts league_NFL.leaderboard
puts league_NFL.summary
