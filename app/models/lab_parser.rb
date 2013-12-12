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
      # parse_lab_dir returns new Lab objects
      parse_lab_dir(lab_dir)
    end
  end

  def parse_lab_dir(lab_dir)
    Lab.new(parse_readme(lab_dir))
  end

  def parse_readme(lab_dir)
    readme_path = Dir[lab_dir + "/README*"].first
    readme_file = File.open(readme_path)
    readme = MarkdownParser.render(readme_file.read)
    # now readme is a well-formatted string of normal html
    yaml_readme = File.open(readme_path)
    url_file = File.open(lab_dir + "/url.txt")
    lab_attrs = {
      :readme => readme,
      :tags => YAML.load(yaml_readme),
      :name => File.basename(lab_dir),
      :github_url => url_file.read.strip
    }
    lab_commits = {
      :commit_history => GitHubApi.get_commits(lab_attrs[:github_url].match(/\/(.*).git$/)[1])
    }
    lab_attrs.merge(lab_commits)
  end
end
