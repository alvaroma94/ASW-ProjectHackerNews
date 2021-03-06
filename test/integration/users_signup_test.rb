require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "invalid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { username:  "Example User",
                               email: "user@example.com",
                               password:              "password",
                               password_confirmation: "password",
                               about: "aboutabout" }
    end
    assert_template 'users/show'
    assert is_logged_in?
  end
end
