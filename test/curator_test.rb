require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_io'
require './lib/artist'
require './lib/curator'
require './lib/photograph'
require 'pry'

class CuratorTest < MiniTest::Test
  def test_it_exists
    skip
    curator = Curator.new
    assert_instance_of Curator, curator
  end

  def test_it_can_add_photographs
    skip
    photo_1 = {
  id: "1",
  name: "Rue Mouffetard, Paris (Boy with Bottles)",
  artist_id: "1",
  year: "1954"
  }

  photo_2 = {
  id: "2",
  name: "Moonrise, Hernandez",
  artist_id: "2",
  year: "1941"
  }

  curator = Curator.new
  curator.add_photograph(photo_1)
  diff [Photograph.new(photo_1)],curator.photographs
  curator.add_photograph(photo_2)
  diff [Photograph.new(photo_1),Photograph.new(photo_2)],curator.photographs
  end

  def test_first_returns_first_photo_object_in_array
    skip
    photo_1 = {
  id: "1",
  name: "Rue Mouffetard, Paris (Boy with Bottles)",
  artist_id: "1",
  year: "1954"
  }

  photo_2 = {
  id: "2",
  name: "Moonrise, Hernandez",
  artist_id: "2",
  year: "1941"
  }

  curator = Curator.new
  curator.add_photograph(photo_1)
  curator.add_photograph(photo_2)
  assert_equal Photograph.new(photo_1), curator.photographs.first

  end

  def test_it_can_add_artists
    skip
    artist_1 = {
  id: "1",
  name: "Henri Cartier-Bresson",
  born: "1908",
  died: "2004",
  country: "France"
  }

  artist_2 = {
  id: "2",
  name: "Ansel Adams",
  born: "1902",
  died: "1984",
  country: "United States"
  }

  curator = Curator.new
  curator.add_artist(artist_1)
  assert_equal [holder_1], curator.artists
  end

  def test_artist_can_return_its_attributes
    artist_1 = {
  id: "1",
  name: "Henri Cartier-Bresson",
  born: "1908",
  died: "2004",
  country: "France"
  }

  artist_2 = {
  id: "2",
  name: "Ansel Adams",
  born: "1902",
  died: "1984",
  country: "United States"
  }

  curator = Curator.new
  curator.add_artist(artist_1)
  curator.add_artist(artist_2)
  assert_equal "Henri Cartier-Bresson", curator.artists.first.name
  end

  def test_find_artist_by_id
    artist_1 = {
  id: "1",
  name: "Henri Cartier-Bresson",
  born: "1908",
  died: "2004",
  country: "France"
  }

  artist_2 = {
  id: "2",
  name: "Ansel Adams",
  born: "1902",
  died: "1984",
  country: "United States"
  }

  curator = Curator.new
  curator.add_artist(artist_1)
  curator.add_artist(artist_2)
  assert_equal Artist.new(artist_1), curator.find_artist_by_id("1").first

  end

  def test_it_can_find_photograph_by_id
    photo_1 = {
  id: "1",
  name: "Rue Mouffetard, Paris (Boy with Bottles)",
  artist_id: "1",
  year: "1954"
  }

  photo_2 = {
  id: "2",
  name: "Moonrise, Hernandez",
  artist_id: "2",
  year: "1941"
  }

  curator = Curator.new
  curator.add_photograph(photo_1)
  curator.add_photograph(photo_2)
  assert_equal Photograph.new(photo_2), curator.find_photograph_by_id("2").first
  end

end
