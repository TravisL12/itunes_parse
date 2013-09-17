def parse_songs(itunes_file)
  data = XmlSimple.xml_in(itunes_file)
  data_count = data['dict'][0]['dict'][0]['dict'].size
  all_songs = []

  data_count.times do |num|
    track = data['dict'][0]['dict'][0]['dict'][num]

    song_attributes = {
     :strings  => Parser.song_strings(track, 'string'),
     :integers => Parser.song_strings(track, 'integer'),
     :dates    => Parser.song_strings(track, 'date') }

    all_songs << Song.new(song_attributes).combine_attributes
  end

  all_songs
end
