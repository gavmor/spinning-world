require 'faker'
require 'ansi'

class String
  include ANSI::Mixin
end


class Denizen
  attr_accessor :world, :name, :strategy, :color

  def initialize(params={})
    @world = params.fetch(:world)
    @strategy = params.fetch(:strategy, [:good, :bad].sample)
    @name = Faker::Name.first_name
    @color = [:red, :yellow, :green, :cyan, :magenta].sample
  end

  def react
    neighbors.each do |neighbor|
      approach neighbor unless self == neighbor
    end
  end

  def take interaction
    interaction.target = self
    recollection.record interaction
    die if wealth <= cost_of_living
  end

  def wealth
    recollection.of(:boon).in_toto - recollection.of(:bane).in_toto
  end

  protected

  def <=> neighbor
     neighbor.wealth <=> wealth
  end

  private

  def recollection
    @recollection ||= Recollection.new
  end

  def neighbors
    world.inhabitants
  end

  def approach neighbor
    case strategy
      when :good then grant neighbor, :boon
      when :bad then grant neighbor, :bane
    end
  end

  def grant neighbor, style
    magnitude = recollection.of(neighbor).in_toto
    interaction = Interaction.new style: style, agent: self, magnitude: magnitude
    neighbor.take interaction
  end

  def die
    world.remove self
  end

  def cost_of_living
    0
  end
end
