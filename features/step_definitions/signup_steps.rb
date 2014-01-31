Given /^there should exist (\w+) with (\w+) (.+)$/ do |model,param, value|
  expect(eval("@user = #{model.capitalize}.find_by_#{param}('#{value}')")).to_not be_nil

end
