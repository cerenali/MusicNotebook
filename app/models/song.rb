# == Schema Information
#
# Table name: songs
#
#  id         :integer          not null, primary key
#  title      :string
#  artist     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist, presence: true
  acts_as_taggable   
  acts_as_taggable_on :tags
  belongs_to :user
  # Favorited by users
  has_many :favorite_songs # just the 'relationships'
  has_many :favorited_by, through: :favorite_songs, source: :user # the actual users favoriting a recipe
end
