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

require 'test_helper'

class FavoriteSongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
