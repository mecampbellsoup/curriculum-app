class Integer

  def format
    to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
  end

end