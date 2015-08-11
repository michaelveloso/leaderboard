class Team

  attr_reader :name
  attr_accessor :wins, :losses, :rank, :games

  def initialize (name)
    @name = name
    @rank = 0
    @wins = 0
    @losses = 0
    @games = []
  end

  def summary
    summary_output = ""
    summary_output << "Name: #{name}\n"
    summary_output << "Ranking: #{rank}\n"
    summary_output << "Record: #{wins}-#{losses}\n"
    game_id = 1
    games.each do |game|
      summary_output << "Game #{game_id}: #{game[:away_team]} @ #{game[:home_team]}, #{game[:away_score]} - #{game[:home_score]}\n"
      game_id += 1
    end
    return summary_output
  end

end
