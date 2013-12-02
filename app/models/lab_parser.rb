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
    Lab.new(parse_readme(lab_dir))
  end

  def parse_readme(lab_dir)
    readme = File.open(lab_dir + "/README.md")
    url_file = File.open(lab_dir + "/url.txt")
    [YAML.load(readme), "name" => File.basename(lab_dir), :github_url => url_file.read ]
  end
end
