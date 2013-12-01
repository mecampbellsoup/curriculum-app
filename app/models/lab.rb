class Lab
  attr_accessor :name, :tags, :github_url

  @@all = []

  def initialize(name, tags)
    @name, @tags = name, tags
    @@all << self
  end

  def self.all
    @@all
  end
end