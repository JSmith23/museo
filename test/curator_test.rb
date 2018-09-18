require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_io'
require './lib/artist'
require './lib/curator'
require './lib/photograph'
require 'pry'

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

  photo_2 = {
  id: "2",
  name: "Moonrise, Hernandez",
  artist_id: "2",
  year: "1941"
  }

  curator = Curator.new
  curry = curator.add_photograph(photo_1)
  assert_equal curry,curator.photographs
  curry_2 = curator.add_photograph(photo_2)
  assert_equal curry_2,curator.photographs
  end

  def test_first_returns_first_photo_object_in_array
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
  curry_1 = curator.add_photograph(photo_1)
  curator.add_photograph(photo_2)
  assert_equal curry_1.first, curator.photographs.first

  end

  def test_it_can_add_artists
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
  curry_1 = curator.add_artist(artist_1)
  curator.add_artist(artist_2)
  assert_equal curry_1, curator.artists
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
  curry_1 = curator.add_artist(artist_1)
  curator.add_artist(artist_2)
  assert_equal curry_1.first, curator.find_artist_by_id("1").first

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
  curry_1 = curator.add_photograph(photo_1)
  curator.add_photograph(photo_2)
  assert_equal curry_1.last, curator.find_photograph_by_id("2").first
  end

  def test_find_photographs_by_artists
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

  photo_3 = {
  id: "3",
  name: "Identical Twins, Roselle, New Jersey",
  artist_id: "3",
  year: "1967"
  }

  photo_4 = {
  id: "4",
  name: "Child with Toy Hand Grenade in Central Park",
  artist_id: "3",
  year: "1962"
  }

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

  artist_3 = {
  id: "3",
  name: "Diane Arbus",
  born: "1923",
  died: "1971",
  country: "United States"
  }

  curator = Curator.new
  curator.add_photograph(photo_1)
  curator.add_photograph(photo_2)
  curator.add_photograph(photo_3)
  curator.add_photograph(photo_4)
  curator.add_artist(artist_1)
  curator.add_artist(artist_2)
  curator.add_artist(artist_3)
  diane_arbus = curator.find_artist_by_id("3")
  expected = [Photograph.new(photo_3),Photograph.new(photo_4)]
  assert_equal expected ,curator.find_photographs_by_artist(diane_arbus)


  end

end
