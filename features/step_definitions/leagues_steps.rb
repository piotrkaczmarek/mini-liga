Given /the following leagues exist/ do |leagues_table|
  leagues_table.hashes.each do |league|
    league[:club_id] ||= Club.first.id
    league[:keeper_id] ||= Keeper.first.id
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

