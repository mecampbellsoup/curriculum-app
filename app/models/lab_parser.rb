class LabParser
  attr_reader :curriculum_path

  def initialize(curriculum_path)
    @curriculum_path = curriculum_path
  end

  def lab_directories
    Dir.glob(File.join(RootFolder, self.curriculum_path) + "/*").map do |lab|
      lab if File.directory?(lab)
    end.compact
  end

  def call
    lab_directories.each do |lab_dir|
      parse_lab_dir(lab_dir)
      # parse_lab_dir returns new Lab objects
    end
  end

  def parse_lab_dir(lab_dir)
    tags, name = parse_readme(lab_dir)
    Lab.new(name, tags)
  end

  def parse_readme(lab_dir)
    readme = File.open(lab_dir + "/README.md")
    [YAML.load(readme), "title" => File.basename(lab_dir)]
  end
end

=begin
def self.get_tags
    tags = Dir.glob(File.join(RootFolder, "/curriculum/") + "*").map do |lab|
      if File.directory?(lab)
        yaml_hash = Lab.read_lab(lab) # returns a yaml hash representing the readme
        yaml_hash.keys
      end
    end
    tags.flatten.compact.uniq
  end

  def self.tag_names_from_id(tag)
    tag_names = Dir.glob(File.join(RootFolder, "/curriculum/") + "*").map do |lab|
      Lab.read_lab_by_tag(lab,tag) if File.directory?(lab)
    end
    tag_names.flatten.compact.uniq
  end

  def self.read_lab(lab) # where lab argument is a file system/directory
    readme = File.open(lab + "/README.md")
    yaml_hash = YAML.load(readme)
    yaml_hash.merge!("title" => File.basename(lab))
  end

  def self.read_lab_by_tag(lab, tag)
    readme = File.open(lab + "/README.md")
    yaml_hash = YAML.load(readme)
    # yaml returns: "languages" => "ruby, rails"
    # we want:      "languages" => [ruby, rails]
    yaml_hash[tag].split(", ")
  end

  def self.read_lab_by_tag_with_id(lab, tag, tag_id) # where lab argument is a file system/directory
    readme = File.open(lab + "/README.md")
    yaml_hash = YAML.load(readme)
    yaml_hash.merge!("title" => File.basename(lab))
    checker = yaml_hash.each do |key, value|
      break true if yaml_hash[tag] && yaml_hash[tag].include?(tag_id)
    end
    yaml_hash if checker == true
  end

  def self.by_tag_with_id(tag, tag_id)
    # only want to return the labs that match that tag and tag_id
    Dir.glob(File.join(RootFolder, "/curriculum/") + "*").map do |lab|
      if File.directory?(lab)
        Lab.read_lab_by_tag_with_id(lab, tag, tag_id)
      else
        next
      end
    end.compact
  end
=end
