class Array
  def make_list 
    list = []
    self.each_with_index do |e, index|
      index += 1
      list << index.to_s + ". " + e
    end
    list
  end
end