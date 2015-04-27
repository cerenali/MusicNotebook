# == Schema Information
#
# Table name: favorite_songs
#
#  id         :integer          not null, primary key
#  song_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FavoriteSong < ActiveRecord::Base
  belongs_to :song
  belongs_to :user
end
