require "pry"
class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs, :genres
  
  @@all = []
  def initialize(name)
    @name = name 
    @songs = []
    # @genres = []
  end
  
  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end

  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song)
  end

  # def songs
  #   Song.all.select{|song| song.artist == self}
  # end

  def genres
    @songs.collect {|song| song.genre }.uniq
  end

end 