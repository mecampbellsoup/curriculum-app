class Lab
  extend Searchable
  # now at Lab class level we have access to our info search methods

  include Committable
  # this module allows each Lab instance to get its own commit history
  
  attr_reader :name, :tags, :github_url, :readme, :commit_history

  @@all = []

  def initialize(args)
    @name, @tags, @readme, @github_url = args[:name], args[:tags], args[:readme], args[:github_url]
    @commit_history = self.get_commits(github_url.match(/\/(.*).git$/)[1])
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_search_query(query)
    all.select { |lab| lab.name =~ /#{query}/ }
  end

end