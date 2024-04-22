# frozen_string_literal: true

module RequestMacros
  def login_user
    before(:each) do
      @user = FactoryBot.build(:user)
      sign_in @user
    end
  end
end
