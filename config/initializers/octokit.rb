# TODO: use this to check all flatiron repos for readme; parse the readme for yaml tags; do the usual magic

# Provide authentication credentials
client = Octokit::Client.new :access_token => ENV['GITHUB_OAUTH_TOKEN']

FlatironRepos = client.repositories('flatiron-school')
# full_names = FlatironRepos.map do |repo|
#   repo.full_name if Octokit.readme(repo)
# end

# readmes = full_names.each do |name|
#   Octokit.readme name, :accept => 'application/vnd.github.html'
# end
