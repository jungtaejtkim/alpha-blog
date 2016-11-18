ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def sign_in_as(user, password)
  	post login_path session: {email: user.email, password: password} #user.password 로 넣으면 hash digest 가 패스워드 폼에 들어감 
  end
end
