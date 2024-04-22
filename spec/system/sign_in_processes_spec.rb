require 'rails_helper'

RSpec.describe "SignInProcesses", type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:password) { "password" }
  let(:user) do
    FactoryBot.create( :user, {
      password: password,
      password_confirmation: password
    })
  end

  it "should require the user to log in and successfully logs in" do
    visit root_path
    within "#new_user" do
      fill_in "user_email", with: user.email
      fill_in "user_password", with: password
    end
    click_button "Log in"
    expect(current_path).to eql(root_path)
  end

  it "should fail on an invalid user" do
    visit root_path
    within "#new_user" do
      fill_in "user_email", with: 'test'
      fill_in "user_password", with: 'password'
    end
    click_button "Log in"
    expect(current_path).to eql(new_user_session_path) end
end
