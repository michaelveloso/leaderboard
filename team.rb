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
    games.each_with_index do |game, index|
      summary_output << "Game #{index + 1}: #{game.away_team} @ #{game.home_team}, #{game.winner} defeat #{game.loser} #{game.winning_score} - #{game.losing_score}\n"
    end
    return summary_output
  end
end
