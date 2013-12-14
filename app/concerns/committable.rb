module Committable

  def get_commits(user = 'flatiron-school', branch = 'master', repo)
    uri = open("https://api.github.com/repos/#{user}/#{repo}/commits?sha=#{branch}&access_token=#{ENV['GITHUB_OAUTH_TOKEN']}")
    commits_array = JSON.load(uri)
    commits_array.map do |commit_hash|
      Commit.new(
        {
          :name    => commit_hash["commit"]["author"]["name"],
          :email   => commit_hash["commit"]["author"]["email"],
          :date    => Time.parse(commit_hash["commit"]["author"]["date"]), 
          :message => commit_hash["commit"]["message"],        
          :avatar  => commit_hash["author"]["avatar_url"],     
          :html    => commit_hash["html_url"]                  
        }
      )
    end
  end

end