Given /the following leagues exist/ do |leagues_table|
  leagues_table.hashes.each do |league|
    League.create!(league)
  end
end
