class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

#  def initialize (name)
#    @name = name
#  end

#  def artist_name=(artist_name)
#    @artist_name = artist_name
#  end

#  def artist_name
#    @artist_name
#  end

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
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if @@all.detect {|song| song.name == name}
      find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(name_artist)
    name_artist_arr = name_artist.split(/[-.]/)
    song = self.new_by_name(name_artist_arr[1].strip)
    song.artist_name = name_artist_arr[0].strip
    song
  end

  def self.create_from_filename(name_artist)
    name_artist_arr = name_artist.split(/[-.]/)
    name = name_artist_arr[1].strip
    song = self.create_by_name(name.strip)
    song.artist_name = name_artist_arr[0].strip
    song
  end

  def self.destroy_all
    @@all = []
  end

end
