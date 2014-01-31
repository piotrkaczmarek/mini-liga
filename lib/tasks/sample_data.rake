namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
      make_users
      make_leagues
    end
  end

  def make_users
    admin = User.create!(first_name: "John",
                 last_name: "Smith",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar",
                 type: "Admin")
    60.times do |n|
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      email = "example-#{n+1}@railstutorial.org"
      password = "password"
      User.create!(first_name: first_name,
                   last_name: last_name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end

  def make_leagues
    20.times do |n|
      name_base = ['Derby','League','UHN','PZPPN', 'NHL']
      name_suffix = ['2013','2014',' Summer 2014', 'Spring 2014', 'Autumn 2013']
      name = name_base.sample + name_suffix.sample + "_#{n}"
      sport = ['tenis', 'squash', 'box', 'mma', 'chess'].sample
      weekday = Random.rand(0..6)
      League.create!(name: name,
                     sport: sport,
                     weekday: weekday)
    end
  end

