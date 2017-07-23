require('minitest/autorun')
require('pry')
require_relative('../models/artists')

class TestArtists < MiniTest::Test

  def setup
    @artist1 = Artist.new({
      'artist_name' => "The Specials",
      })
  end

  def test_artist
    assert_equal(, @artist1.class)
  end
end