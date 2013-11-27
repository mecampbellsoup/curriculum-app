class Lab
  def self.read_files
    Dir.glob(File.join(RootFolder, "/curriculum/") + "**/*.md").map do |readme_file|
      f = File.open(readme_file)
      YAML.load(f)
      # each YAML hash should know which lab it belongs to, no?
    end
  end
end