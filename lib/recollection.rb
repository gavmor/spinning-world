class Recollection
  def initialize
    @sequence = []
  end

  def record interaction
    @sequence << interaction
  end

  def of entity
    @sequence.select {|i| i.style == entity || i.agent == entity }
  end
end

class Array
  def in_toto
    return 1 unless self.any?
    self.map(&:magnitude).reduce(:+)
  end
end
