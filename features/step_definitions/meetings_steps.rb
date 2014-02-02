Given /the following meetings exist/ do |meetings_table|
  meetings_table.hashes.each do |meeting|
    meeting[:league_id] ||= League.first.id
    league = League.find(meeting[:league_id])
    league.seasons.first.game_classes.first.meetings.create!(date: meeting[:date])
  end
end
