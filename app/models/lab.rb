class Lab
  extend Searchable
  # now at Lab level we have access to our info search methods
  
  attr_accessor :name, :tags, :github_url

  @@all = []

  def initialize(*args)
    @name, @tags = name, tags, 
    @@all << self
  end

  def self.all
    @@all
  end
end