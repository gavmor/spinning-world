require 'logger'

class Recollection
  def initialize
    @sequence = []
  end

  def record interaction
    @sequence << interaction
    log interaction
  end

  def of entity
    @sequence.select {|i| i.style == entity || i.agent == entity }
  end

  private

  def self.logger
    @logger ||= Logger.new('log').tap do |logger|
      logger.formatter = ->(_, _, _, msg){"#{msg}\n"}
    end
  end

  def log interaction
    line = [interaction.agent.name, interaction.magnitude, interaction.target.name].join ','
    self.class.logger.info line
  end
end

class Array
  def in_toto
    return 1 unless self.any?
    self.map(&:magnitude).reduce(:+)
  end
end
