class Commit

  attr_accessor :name, :email, :date, :message, :avatar, :html

  @@all = []
  
  def initialize(args)
    @name = args[:name]
    @email = args[:email]
    @date = args[:date]
    @message = args[:message]
    @avatar = args[:avatar]
    @html = args[:html]
  end

  def self.all
    @@all
  end

end