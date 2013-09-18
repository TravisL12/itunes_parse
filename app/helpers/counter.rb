module Counter

  def self.artist_count(songs)
    artists_count = {}

    songs.each do |song|
      artists_count.has_key?(song['Artist']) ? artists_count[song['Artist']] += 1 : artists_count[song['Artist']] = 1
    end
    artists_count.sort_by { |artist, count| count }.reverse
  end

  def self.artist_play_count(songs)
    play_count = {}

    songs.each do |song|
      next unless song['Play Count']
      play_count.has_key?(song['Artist']) ? play_count[song['Artist']] += song['Play Count'] : play_count[song['Artist']] = song['Play Count']
    end
    play_count.sort_by { |artist, play_ct| play_ct }.reverse
  end

  def self.song_by_year(songs)
    year_count = {}

    songs.each do |song|
      next unless song['Year']
      year_count.has_key?(song['Year']) ? year_count[song['Year']] += 1 : year_count[song['Year']] = 1
    end
    year_count.sort_by { |year, count| year }.reverse
  end

end
