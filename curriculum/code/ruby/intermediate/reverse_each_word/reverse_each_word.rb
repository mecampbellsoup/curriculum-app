#Write a method that takes a sentence and returns it with each word reversed in place.

class String
  def reverse_each_word
    result = []
    split(/\s/).reverse.each do |word|
      result << word.reverse
    end
    result.join(' ')
  end
end