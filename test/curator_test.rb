require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_io'
require './lib/artist'
require './lib/curator'

class CuratorTest < MiniTest::Test
  def test_it_exists
    curator = Curator.new
    assert_instance_of Curator, curator
  end

  def test_it_can_add_photographs
    photo_1 = {
  id: "1",
  name: "Rue Mouffetard, Paris (Boy with Bottles)",
  artist_id: "1",
  year: "1954"
  }
  curator = Curator.new
   
  end
end
