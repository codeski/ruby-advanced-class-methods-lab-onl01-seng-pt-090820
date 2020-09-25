require 'pry'

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
    song.save
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if 
      self.find_by_name(name)
      self.find_by_name(name)
    else 
      self.create_by_name(name)
    end
  end
    
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file)
    new = file.split(" - ")
    file.collect do |data|
      binding.pry
    name = data[0]
    artist = data[1] 
    song = self.new 
    song.name = name
    song.artist = artist
    song
  end
  end
  
  def self.create_from_filename
  end
  
  def self.destroy_all
    @@all.clear
  end
 
end
