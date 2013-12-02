module Searchable

  def get_tags(labs)
    labs.collect { |lab| lab.tags.keys }.flatten.uniq
  end

  def tag_names_from_category(tag, labs)
    matches = labs.select { |lab| lab.tags.keys.include?(tag) }
    matches.collect { |l| l.tags[tag].to_s.split(", ") }.flatten.uniq
  end

  def matching_tag_id(labs, tag, tag_id)
    labs.select { |l| l.tags[tag] && l.tags[tag].to_s.include?(tag_id)}
  end

end