class Lab
  extend Searchable
  # now at Lab level we have access to our info search methods
  
  attr_accessor :name, :tags, :github_url

  @@all = []

  def initialize(args)
    @name = args[:name]
    @tags = args[:tags]
    @github_url = args[:github_url] 
    @@all << self
  end

  def self.all
    @@all
  end
end