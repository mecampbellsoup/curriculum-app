class GitHubApi
  github_connection = Github.new :client_id => ENV['GITHUB_CLIENT_ID'], :client_secret => ENV['GITHUB_CLIENT_SECRET']
  branches_info = {}
  all_branches = git_connection.repos.list_branches 'mecampbellsoup', 'curriculum-app'

  all_branches.body.each do |branch|
    branches_info["#{branch.name}".to_s] = "#{branch.commit.url}"
  end

  branches_info.keys.each do |branch|
    commits_list.push (git_connection.repos.commits.list 'mecampbellsoup','curriculum-app', Chronic.parse("1 week ago"), Today, :sha => "master")
  end
  binding.pry
end