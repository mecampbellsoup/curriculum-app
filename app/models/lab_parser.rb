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
    [YAML.load(readme), "name" => File.basename(lab_dir)]
  end
end
