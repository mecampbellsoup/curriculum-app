require 'octokit'
require 'pry'
require 'yaml'
require 'dotenv'

Dotenv.load

binding.pry
    
# TODO: use this to check all flatiron repos for readme; parse the readme for yaml tags; do the usual magic

# Provide authentication credentials
client = Octokit::Client.new \
  :client_id     => ENV["GITHUB_CLIENT_ID"],
  :client_secret => ENV["GITHUB_CLIENT_SECRET"]

# client = Octokit::Client.new :login => 'mecampbellsoup', :password => 'imahoe!1'

# Getting all the repos associated with the argument/account passed to the method
TestRepos = client.repositories('mecampbellsoup')

# Getting an array of the full names of each repo
full_names = TestRepos.map do |repo|
  repo.full_name
end

# Getting an array of the repos, as hashes, which have READMEs available (i.e. respond to the .readme method)
readmes = full_names.map do |name|
  begin
  link = (client.readme name)._links.html
  content = client.readme name, :accept => 'application/vnd.github.VERSION.raw'
  rescue
    next
  end
  { :link => link, :content => content }
end.compact.reject { |hash| hash[:content] == nil || hash[:link] == nil }

# Getting an array of the repos which have READMEs that respond to YAML.load
yaml_from_readmes = readmes.map do |lab_hash|
  begin
    yaml_tags = YAML.load(lab_hash[:content])
  rescue
    next
  end
  { :link => lab_hash[:link], :yaml_tags => yaml_tags }
end.compact.select { |yaml_readme| yaml_readme.is_a? Hash }

# Now I have an array of links and the associated YAML tags...

binding.pry