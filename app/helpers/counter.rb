module Counter

  def self.song_display(songs)
    songs.each do |song|
      song.each { |k,v| puts "#{k}: #{v}" if DISPLAY.include?(k) }
      puts
    end
  end

  def self.artist_count(songs)
    artists_count = {}
    songs.each do |song|
      artists_count.has_key?(song['Artist']) ? artists_count[song['Artist']] += 1 : artists_count[song['Artist']] = 1
    end
    print_songs(artists_count)
  end

  def self.artist_play_count(songs)
    play_count = {}

    songs.each do |song|
      next unless song['Play Count']
      play_count.has_key?(song['Artist']) ? play_count[song['Artist']] += song['Play Count'] : play_count[song['Artist']] = song['Play Count']
    end
    print_songs(play_count)
  end

  def self.play_frequency(songs)
    songs.each do |song|
      if song['Date Added']
        puts "Artist: #{song['Artist']}"
        puts "Name: #{song['Name']}"
        puts "Length: #{(DateTime.now - song['Date Added']).to_i}"
        puts
      end
    end
  end

  def self.print_songs(songs)
    songs.each { |k, v| puts "#{k} #{v}" }
  end

end
