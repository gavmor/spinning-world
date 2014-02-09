class Leaderboard

  def initialize players
    @players = players
  end

  def display
    @players.sort.map do |player|
      name = player.name[0..2].send player.color
      score = player.wealth

      "#{name} ~ #{score}"
    end << ['-'*10]
  end

end
