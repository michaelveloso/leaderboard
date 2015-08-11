class Game
  attr_accessor :home_team, :away_team, :home_score, :away_score

  def initialize (args)
    @home_team = args[:home_team]
    @away_team = args[:away_team]
    @home_score = args[:home_score]
    @away_score = args[:away_score]
  end

  def winner
    if home_score > away_score
      home_team
    else
      away_team
    end
  end

  def loser
    if home_score > away_score
      away_team
    else
      home_team
    end
  end

  def winning_score
    if home_score > away_score
      home_score
    else
      away_score
    end
  end

  def losing_score
    if home_score > away_score
      away_score
    else
      home_score
    end
  end

end
