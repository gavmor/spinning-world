class Memory
  def initialize
    @sequence = []
  end

  def record interaction
    @sequence << interaction
    log interaction
  end

  def of style
    @sequence.select {|interaction| interaction.style == style}
  end

  def log interaction
    line = [interaction.agent.name, interaction.style, interaction.target.name].join ':'
    File.open('log', 'a').puts line
  end
end
