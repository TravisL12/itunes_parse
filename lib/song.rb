class Song

  def initialize(song_attributes)
    @strings  = song_attributes[:strings]
    @integers = song_attributes[:integers]
    @dates    = song_attributes[:dates]
  end

  def combine_attributes
    total_song = {}
    [@strings, @integers, @dates].each do |type|
      type.each { |k, v| total_song[k] = v }
    end
    total_song
  end

end
