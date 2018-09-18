require './lib/photograph'

class Curator
  attr_reader :artists,
              :photographs

  def initialize
    @artists = []
    @photographs = []
  end

  def add_photograph(photograph_attributes)
    @photographs << Photograph.new(photograph_attributes)
  end

  def add_artist(artist_attributes)
    @artists << Artist.new(artist_attributes)
  end

  def find_artist_by_id(id)
    @artists.find_all do |artist|
      artist.id == id
    end
  end

  def find_photograph_by_id(id)
    @photographs.find_all do |photograph|
      photograph.id == id
    end
  end

#   def find_photographs_by_artist(artist)
#     holder = []
#     @photographs.each do |photograph|
#       artist.each do |art|
#         if photograph.artist_id == art.id
#           holder << photograph
#         end
#       end
#     end
#   end
# end


  def find_photographs_by_artist(artist)
    @photographs.find_all do |photograph|
      artist.each do |art|
        photograph.artist_id == art.id
      end
    end
  end
end
