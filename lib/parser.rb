module Parser

  def self.song_strings(track, type)
    eval_attribute = track['key'].select { |val| CATEGORIES.keys.include?(val) && CATEGORIES[val] == type }
    parse_song(eval_attribute, track, type)
  end

  def self.parse_song(eval_attribute, track, type)
    all_attribute = {}
    eval_attribute.each_with_index do |attribute, index|
      case type
      when 'integer'
        all_attribute[attribute] = track[type][index].to_i
      when 'string'
        all_attribute[attribute] = track[type][index]
      when 'date'
        all_attribute[attribute] = parse_date(track[type][index])
      end
    end
    all_attribute
  end

  def self.parse_date(date)
    DateTime.strptime(date, '%Y-%m-%dT%H:%M:%S%z')
  end

end
