class Array

  def symbol_roundup
    results = []
    self.each do |e|
      results << e if e.is_a?Symbol
    end
    results
  end

  def symbol_roundup!
    results = []
    self.each do |e|
      results << e if e.is_a?Symbol
    end
    self.replace(results)
  end

end