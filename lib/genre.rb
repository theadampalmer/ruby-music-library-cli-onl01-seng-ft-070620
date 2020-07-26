class Genre 
  extend Concerns::findable
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def save
    self.class.all << self
  end
  
  def self.destroy_all
    all.clear
  end
  
  def self.create(name)
    genre = new(name)
    genre.save
    genre
  end
  
  def genres
    songs.map(&:artist).uniq
  end
  
end