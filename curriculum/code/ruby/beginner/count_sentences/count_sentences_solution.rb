class String
  def count_sentences
    split(/\.|\?|!/).length  
  end
end