Given /the following leagues exist/ do |leagues_table|
  leagues_table.hashes.each do |league|
    league[:club_id] ||= Club.first.id
    league[:keeper_id] ||= Keeper.first.id
    League.create!(league)
  end
end
