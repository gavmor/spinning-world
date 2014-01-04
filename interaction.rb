class Interaction
  attr_accessor :style, :magnitude, :agent, :target

  def initialize style: nil, agent: nil, magnitude: 1
    @style = style
    @agent = agent
    @target = target
    @magnitude = magnitude
  end
end
