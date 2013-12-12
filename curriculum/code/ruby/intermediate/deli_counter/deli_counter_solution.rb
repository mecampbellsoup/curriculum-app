class Deli
  attr_accessor :line

  def initialize(line = [])
    @line = line
  end

  def take_a_number name
    number = line.length + 1
    line << "#{number}. " + name
    number
  end

  def now_serving
    line.shift
  end
end