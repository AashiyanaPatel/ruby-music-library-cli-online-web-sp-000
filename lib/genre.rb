class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def artists
    artists = @songs.collect do |song|
      song.artist
    end
    artists.uniq
  end
end