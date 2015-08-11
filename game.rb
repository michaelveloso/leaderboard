class Game
  attr_accessor :home_team, :away_team, :home_score, :away_score

  def initialize (args)
    @home_team = args[:home_team]
    @away_team = args[:away_team]
    @home_score = args[:home_score]
    @away_score = args[:away_score]
  end

  def winner
    home_score > away_score ? home_team : away_team
  end

  def loser
    home_score > away_score ? away_team : home_team
  end

  def winning_score
    home_score > away_score ? home_score : away_score
  end

  def losing_score
    home_score > away_score ? away_score : home_score
  end

end
