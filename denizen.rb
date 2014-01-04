require 'faker'

class Denizen
  attr_accessor :world, :name, :strategy

  def initialize(params={})
    @world = params.fetch(:world)
    @strategy = params.fetch(:strategy, [:good, :bad].sample)
    @name = Faker::Name.first_name
  end

  def react
    neighbors.each do |neighbor|
      approach neighbor unless self == neighbor
    end
  end

  def take interaction
    interaction.target = self
    memory.record interaction
    # die if wealth <= 0
  end

  def wealth
    boon_magnitude - bane_magnitude
  end

  protected

  def <=> neighbor
     neighbor.wealth <=> wealth
  end

  private

  def boon_magnitude
    memory.of(:boon).map(&:magnitude).reduce(:+) || 0
  end

  def bane_magnitude
    memory.of(:bane).map(&:magnitude).reduce(:+) || 0
  end

  def memory
    @memory ||= Memory.new
  end

  def neighbors
    world.inhabitants
  end

  def approach neighbor
    case strategy
    when :good then assist neighbor
    when :bad then attack neighbor
    end
  end

  def attack neighbor
    neighbor.take Interaction.new(style: :bane, agent: self)
  end

  def assist neighbor
    neighbor.take Interaction.new(style: :boon, agent: self)
  end

  def die
    world.remove self
  end
end
