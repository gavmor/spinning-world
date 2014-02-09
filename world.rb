class World
  attr_accessor :inhabitants, :age, :starting_population

  def initialize(population: 3)
    @age = 0
    @starting_population = population.times.map { Denizen.new(world: self) }
    @inhabitants = starting_population.dup
    @cemetary = []
  end

  def advance
    @age += 1
    # inhabitants.each &:react
    inhabitants.map {|i| Thread.new {i.react} }.each &:join
    puts leaderboard
  end

  def spin(generations: 3)
    @started_at = Time.now
    generations.times { advance }
    @ended_at = Time.now
    stats
  end

  def wealth
    inhabitants.map(&:wealth).reduce(:+)
  end

  def winner
    inhabitants.sort!.first
  end

  def loser
    inhabitants.sort!.last
  end

  def remove inhabitant
    inhabitants.delete inhabitant
    @cemetary << inhabitant
  end

  private
  attr_accessor :started_at, :ended_at, :cemetary

  def leaderboard
    inhabitants.sort.map do |player|
      "#{player.name[0..2]} ~ #{player.wealth}"
    end << ['-'*10]
  end

  def stats
    {
        age: age,
        starting_size: starting_population.size,
        ending_size: inhabitants.size,
        winner_at: winner.wealth,
        loser_at: loser.wealth,
        disparity: disparity,
        duration: duration
    }
  end

  def duration
    (ended_at - started_at).to_i
  end

  def disparity
    puts "winner.wealth: #{winner.wealth}"
    puts "loser.wealth: #{loser.wealth}"
    (loser.wealth/winner.wealth.to_f).round(2)
  end
end
