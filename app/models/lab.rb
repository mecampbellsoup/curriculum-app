class Lab
  extend Searchable
  # now at Lab level we have access to our info search methods
  
  attr_accessor :name, :tags, :github_url, :readme

  @@all = []

  def initialize(args)
    @name = args[:name]
    @tags = args[:tags]
    @github_url = args[:github_url]
    @readme = args[:readme] 
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    all.select { |lab| lab.name == name }.first
  end
end