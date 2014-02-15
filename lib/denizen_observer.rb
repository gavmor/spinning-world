require_relative 'denizen'
require 'logger'

class DenizenObserver
  def initialize
    @lines = []
    Denizen.wiretap(:take) do |evidence|
      self.witness evidence
    end
  end
  
  def witness evidence
    log(evidence[:args][0])
  end
  
  def self.logger
    @logger ||= Logger.new('log').tap do |logger|
      logger.formatter = ->(_, _, _, msg){"#{msg}\n"}
    end
  end

  def log interaction
    @lines << [interaction.agent.name, interaction.magnitude, interaction.target.name].join(',')
    flush_log if @lines.length > 10_000
  end
  
  def flush_log
    self.class.logger.info @lines.join("\n")
    @lines.clear
  end
  
  def finalize
    flush_log
  end
end

