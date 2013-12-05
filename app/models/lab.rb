class Lab
  extend Searchable
  # now at Lab level we have access to our info search methods
  
  attr_accessor :name, :tags, :github_url, :readme, :commit_history

  @@all = []

  def initialize(args)
    @name = args[:name]
    @tags = args[:tags]
    @readme = args[:readme]
    @github_url = args[:github_url]
    @commit_history = args[:commit_history]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_search_query(query)
    all.select { |lab| lab.name =~ /#{query}/ }
  end

end