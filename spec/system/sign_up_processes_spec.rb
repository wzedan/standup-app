require 'rails_helper'

RSpec.describe "SignUpProcesses", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "should sign up" do
    visit root_path
    click_on "Sign up"

    within "#new_user" do
      fill_in "user_email", with: 'test@test.com'
      fill_in "user_password", with: 'password123'
      fill_in "user_password_confirmation", with: 'password123'
    end
    click_button "Sign Up"
    expect(current_path).to eql(new_accounts_path)

    within "#new_account" do
      fill_in "account_name", with: "Test Account"
    end

    click_button "Save"

    expect(current_path).to eql(root_path)
  end

  it "should not save invalid user" do
    visit root_path
    click_on "Sign up"

    within "#new_user" do
      fill_in "user_email", with: 'test@test.com'
      fill_in "user_password", with: '123'
    end

    click_button "Sign Up"

    expect(current_path).to eql("/users")
    expect(page).to have_content("error")

  end
end
