require 'json'
require 'open-uri'

class RepoScraper

  def initialize(user)
    @user = user
    scrape_repos
  end

  def check_if_contributor(user)
    contributors = JSON.parse(open("https://api.github.com/repos/#{self["owner"]["name"]}/#{self["name"]}/contributors?access_token=#{user.token}").read)
    contributors.each { |contributor| return true if contributor["id"].to_s == user.github_id }
    false
  end

  def get_repos
    repos = []
    page_index = 1
    stop = false
    while !stop
      repos_page = JSON.parse(open("https://api.github.com/users/#{@user.name}/repos?page=#{page_index}&access_token=#{@user.token}").read)
      stop = true if repos_page.count == 0
      repos << repos_page
      page_index += 1
    end
    repos.flatten
  end

  def scrape_repos
    get_repos.each do |repo|
      repo_check = Repo.where(:github_id => repo["id"])

      contributors = JSON.parse(open("https://api.github.com/repos/#{repo["owner"]["login"]}/#{repo["name"]}/contributors?access_token=#{@user.token}").read)
      contributor_status = contributors.collect{|contributor| contributor["id"].to_s}.include?(@user.github_id)

      if repo_check.empty? && contributor_status
        new_repo = Repo.new
        new_repo.github_id = repo["id"]
        new_repo.name = repo["name"]
        new_repo.published_at = repo["published_at"]
        new_repo.url = repo["url"]
        new_repo.html_url = repo["html_url"]
        new_repo.user_id = @user.id
        new_repo.github_owner_id = repo["owner"]["id"]

        puts "saved successfully" if new_repo.save
      end
    end     
  end
end
