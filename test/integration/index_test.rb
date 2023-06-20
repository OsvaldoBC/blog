require 'test_helper'
require 'capybara/rails'

class IndexTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  setup do
    # Configurations before the tests
  end

  test 'index test' do
   
    visit user_path(user)

    click_button 'Create a new Post'

    # Assign a valid author (user) to the post
    fill_in 'Author', with: user.id # Adjust this based on your form field

    click_button 'Create Post'

    assert_equal new_post_path, current_path
  end
end

