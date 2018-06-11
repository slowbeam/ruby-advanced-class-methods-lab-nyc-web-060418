require 'pry'

class Song
  attr_accessor :name, :artist_name

  @@all = []

  def initialize(name = nil)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = Song.new
    @@all << new_song
    return new_song
  end

  def self.new_by_name(song_name)
    new_song = Song.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = Song.new
    new_song.name = song_name
    @@all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    @@all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
      #so if all songs do not include a song with the name song_name create a new song with that name.
      #if self.find_name
      if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
      else self.find_by_name(song_name)
      end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name.downcase}
  end

  def self.new_from_filename(song_file)
    # binding.pry
    song_file = song_file.split(" - ")
    song_file[1] = song_file[1][0...-4]
    new_song = Song.new(song_file[1])
    new_song.artist_name = song_file[0]
    new_song
  end
end


pyscho = Song.new("psycho")
paranoid = Song.new("paranoid")
rockstar = Song.new("rockstar")


Song.find_or_create_by_name("psycho")
Song.new_from_filename("Taylor Swift - Blank Space.mp3")
# binding.pry
