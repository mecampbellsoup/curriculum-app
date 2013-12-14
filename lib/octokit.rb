# TODO: use this to check all flatiron repos for readme; parse the readme for yaml tags; do the usual magic

# Provide authentication credentials
client = Octokit::Client.new( :access_token => ENV["GITHUB_OAUTH_TOKEN"] )

# Getting all the private repos associated with the argument/account passed to the method
all_repos = client.org_repos( 'flatiron-school', { :type => 'private' } )

# Getting an array of the full names of each repo
full_names = all_repos.map { |repo| repo.full_name }

# Getting an array of only the repos, as hashes, which have READMEs available (i.e. respond to the .readme method) by skipping those that do not
LabHashes = full_names.map do |name|
  begin
    link = (client.readme name)._links.html
    content = client.readme name, :accept => 'application/vnd.github.VERSION.raw'
    yaml_tags = YAML.load(content)
  rescue
    next
  end
  { :link => link, :content => content, :ssh => "git@github.com:#{name}.git", :yaml_tags => yaml_tags }
end.compact.reject { |hash| hash[:content] == nil || hash[:link] == nil || !hash[:yaml_tags].is_a?(Hash) }

# Now I have an array of links and the associated YAML tags...