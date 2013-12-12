function count_sentences(string) {
  return string.split(/\.|\?|!/).length -1
}