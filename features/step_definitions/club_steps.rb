Given /^there is club named (.+) in (\w+) city$/ do |club,city|
  @city = City.create(name: city)
  @club = @city.clubs.create(name: club)
end
