namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
      make_users
      make_cities
      make_clubs
      make_keepers
      make_leagues
    end
  end

  def make_users
    admin = User.create!(first_name: "John",
                 last_name: "Smith",
                 email: "admin@ml.com",
                 password: "password",
                 password_confirmation: "password",
                 type: "Admin")
    60.times do |n|
      email = "player#{n}@ml.com"
      password = "password"
      User.create!(first_name: Faker::Name.first_name,
                   last_name: Faker::Name.last_name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end

  def make_cities
    ['Warsaw','Berlin','Los Angeles','Tokio','London','Dallas'].each do |city|
      City.create!(name: city)
    end
  end

  def make_clubs
    prefixes = ['Fit','Sport','Center','Gym','Playground']
    City.all.each do |city|
      Random.rand(1..3).times do
        city.clubs.create!(name: "#{prefixes.sample}#{city.name}")
      end
    end
  end

  def make_keepers
    5.times do |n|
      keeper = User.create!(first_name: Faker::Name.first_name,
                            last_name: Faker::Name.last_name,
                            email: "keeper#{n}@ml.com",
                            password: "password",
                            password_confirmation: "password",
                            type: "Keeper",
                            club_id: Club.pluck(:id).sample)
    end
  end

  def make_leagues
    20.times do |n|
      name_base = ['Derby','League','UHN','PZPPN', 'NHL']
      name_suffix = ['2013','2014',' Summer 2014', 'Spring 2014', 'Autumn 2013']
      name = name_base.sample + name_suffix.sample + "_#{n}"
      sport = ['tenis', 'squash', 'box', 'mma', 'chess'].sample
      prize = ['carrot', '$$$', '1mln euro','cup','medal'].sample
      description = Faker::Lorem.sentences(3).join
      weekday = Random.rand(0..6)
      League.create!(name: name,
                     sport: sport,
                     weekday: weekday,
                     prize: prize,
                     description: description,
                     club_id: Club.pluck(:id).sample,
                     keeper_id: Keeper.pluck(:id).sample)
    end
  end

