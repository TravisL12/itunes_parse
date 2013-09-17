require 'xmlsimple'
require_relative 'lib/attribute_constants'
require_relative 'lib/parser'
require_relative 'lib/counter'
require_relative 'lib/song'

data = XmlSimple.xml_in('itunes_xml/itunes_small2.xml')
# data = XmlSimple.xml_in('itunes_xml/iTunes Library.xml')
data_count = data['dict'][0]['dict'][0]['dict'].size
all_songs = []

data_count.times do |num|
  track = data['dict'][0]['dict'][0]['dict'][num]

  song_attributes = {
   :strings  => Parser.song_strings(track, 'string'),
   :integers => Parser.song_strings(track, 'integer'),
   :dates    => Parser.song_strings(track, 'date')
 }

 all_songs << Song.new(song_attributes).combine_attributes
end

# Runtime
until false do
  puts
  puts "*" * 30
  puts "What do you want to do?"
  puts "1. play_frequency"
  puts "2. song_display"
  puts "3. artist_count"
  puts "4. artist_play_count"
  puts "5. Exit"
  print "< "
  entry = gets.chomp

  case entry
  when '1'
    Counter.play_frequency(all_songs)
  when '2'
    Counter.song_display(all_songs)
  when '3'
    Counter.artist_count(all_songs)
  when '4'
    Counter.artist_play_count(all_songs)
  when '5'
    break
  end
end
