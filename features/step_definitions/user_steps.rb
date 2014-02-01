Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    
    user[:password] = "password"
    user[:password_confirmation] = user[:password]
    if user[:type] == "Keeper"
      user[:club_id] ||= Club.first.id
    end
    User.create!(user)
  end
end

Given /^I am logged in as (\w+) (\w+)$/ do |first_name, last_name|
  visit signin_path
  @user = User.where(first_name: first_name, last_name: last_name).first
  fill_in "Email",    with: @user.email
  fill_in "Password", with: "password"
  click_button "Sign in"
end

Given(/^user (\w+) (\w+) should be (\w+)$/) do |first_name, last_name, type |
  user = User.where(first_name: first_name, last_name: last_name).first
  expect(user.type).to eq type.capitalize
end

Given /^there is a keeper named (\w+) (\w+)$/ do |first_name,last_name|
  FactoryGirl.create(:user, first_name: first_name, last_name: last_name, type: "Keeper")
end
