# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'
    when /^the (.*) league page$/
      league_path(League.find_by_name($1))
    when /http:\/\/(.+)/
      "http://#{$1}"
    when /^my keeper's leagues page$/
      leagues_keeper_path(@user)
    when /^the (.+)'s league edit page$/
      edit_league_path(League.find_by_name($1))
    when /^the (\w+) (\w+)'s user edit page$/
      edit_user_path(User.where(first_name: $1, last_name: $2).first)
    when /^the (\w+) (\w+)'s user page$/
      user_path(User.where(first_name: $1, last_name: $2).first)
    when /^the reset password page$/
      edit_password_reset_path(id: @user.reload.password_reset_token)
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
