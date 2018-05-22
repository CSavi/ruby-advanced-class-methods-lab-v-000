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
    s = self.new
    s.save
    s
  end 
  
  def self.new_by_name(song_name)
    song = self.new 
    song.name = song_name
    song
  end   

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end   
  
  def self.find_by_name(song_name)
    self.all.detect {|song| song.name == song_name}
  end  
  
  
  def self.find_or_create_by_name(check_song_name)
    self.find_by_name(check_song_name) || self.create_by_name(check_song_name)
  end   
  
  def self.alphabetical 
    @@all.sort_by! {|song| song.name}
  end  
  
  def self.new_from_filename(filename)
    filename = self.new 
    self.new_by_name
    self.filename.split(/\w|"-"|/).slice!(".mp3").join(" ")
  end 
  
  
  
  
  
  
  def self.create_from_filename(filename)
  end   
  #binding.pry 
  
  def self.destroy_all 
    @@all.clear 
  end   
    
end
