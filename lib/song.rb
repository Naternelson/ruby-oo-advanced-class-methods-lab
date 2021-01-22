
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    #the @@all containes every instance of Song
    #The .find method returns the first elment that matches the criteria
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
     self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort {|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(filename)
    name = filename.split(" - ")[1].split(".")[0] #returns the song name without the .mp3
    song = self.new_by_name(name) #Initiates the the song
    song.artist_name = filename.split(" - ")[0] #Assigns the artist name
    song
  end

  def self.create_from_filename(filename)
    name = filename.split(" - ")[1].split(".")[0] #returns the song name without the .mp3
    song = self.create_by_name(name) #Initiates the the song
    song.artist_name = filename.split(" - ")[0] #Assigns the artist name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
