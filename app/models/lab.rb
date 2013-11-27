class Lab
  
  def self.read_file_system
    Dir.glob(File.join(RootFolder, "/curriculum/") + "*").map do |lab|
      if File.directory?(lab)
        Lab.read_lab(lab)
      else
        next
      end
      # each YAML hash should know which lab it belongs to, no?
    end.compact
  end

  def self.read_lab(lab) # where lab argument is a file system/directory
    readme = File.open(lab + "/README.md")
    lab_hash = YAML.load(readme)
    lab_hash.merge!("title" => File.basename(lab))
  end

  def self.read_lab_by_tag(lab, tag, tag_id) # where lab argument is a file system/directory
    readme = File.open(lab + "/README.md")
    lab_hash = YAML.load(readme)
    lab_hash.merge!("title" => File.basename(lab))
    checker = lab_hash.each do |key, value|
      break true if lab_hash[tag] && lab_hash[tag].include?(tag_id)
    end
    lab_hash if checker == true
  end

  def self.by_tag_with_id(tag, tag_id)
    # only want to return the labs that match that tag and tag_id
    Dir.glob(File.join(RootFolder, "/curriculum/") + "*").map do |lab|
      if File.directory?(lab)
        Lab.read_lab_by_tag(lab, tag, tag_id)
      else
        next
      end
    end.compact
  end

end