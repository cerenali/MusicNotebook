# == Schema Information
#
# Table name: songs
#
#  id         :integer          not null, primary key
#  title      :string
#  artist     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  url        :string
#

class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist, presence: true
  acts_as_taggable   
  acts_as_taggable_on :tags
  belongs_to :user
  # Favorited by users
  has_many :favorite_songs
  has_many :favorited_by, through: :favorite_songs, source: :user

  def self.search(query)
    # search YT
    @songs = []
    videos = Yt::Collections::Videos.new.where(q: query, order: 'viewCount').first(10)
    videos.each do |v|
      song = Song.new
      song.title = v.title
      song.artist = v.channel_title
      song.url = v.id
      song.id = rand(500)
      @songs.push(song)
    end
    results = Song.where("title LIKE ?", "%" + query + "%")
    results.each do |r|
      @songs.push(r)
    end
    @songs
  end
end
