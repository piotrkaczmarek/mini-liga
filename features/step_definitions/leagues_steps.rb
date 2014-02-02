Given /the following leagues exist/ do |leagues_table|
  leagues_table.hashes.each do |league|
    league[:club_id] ||= Club.first.id
    league[:keeper_id] ||= Keeper.first.id
    league[:weekday] ||= 3
    League.create!(league)
  end
end

And /^I select (\w+) in (.+) "([^"]*)"$/  do |choice, model, selector|
  select(choice, from: "#{model}[#{selector}]")
end

Then(/^league (.+) should exist$/) do |name|
  expect(League.find_by_name(name)).to_not be_nil
end

Then(/^league (.+) should not exist$/) do |name|
  expect(League.find_by_name(name)).to be_nil
end

Given /the following seasons exist/ do |seasons_table|
  seasons_table.hashes.each do |season|
    season[:league_id] ||= League.first.id
    Season.create!(season)
  end
end

Given /the following game classes exist/ do |game_classes_table|
  game_classes_table.hashes.each do |game_class|
    game_class[:season_id] ||= Season.first.id
    GameClass.create!(game_class)
  end
end
