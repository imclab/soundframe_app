class Track < ActiveRecord::Base
  attr_accessible :artwork_url, :artist, :genre, :permalink_url, :soundcloud_track_id, :title, :user_id


	has_many :project_tracks
  has_many :projects, through: :project_tracks
  has_many :library_tracks
  has_many :libraries, through: :library_tracks

  validates :soundcloud_track_id, :uniqueness => true


  def self.find_and_save_lat_lons(query)
    query.each do |item, location|
      location[:input].gsub!(" ", '+')
      location[:input].gsub!(",", "+")
      request = Typhoeus.get("http://maps.googleapis.com/maps/api/geocode/json?address=#{location[:input]}&sensor=true")
      hash = JSON.parse(request.body)
      track = Track.find_or_create_by_soundcloud_track_id(location["track_id"])
      track.save_lat_lon(hash["results"]) unless hash["results"].empty?
    end
  end



end
