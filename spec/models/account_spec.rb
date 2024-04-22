require 'rails_helper'

RSpec.describe Account, type: :model do
  context "valid factor" do
    it "has valid factory" do
      expect(FactoryBot.build(:account)).to be_valid
    end
  end

  context "valid validation" do
    it "cannot save accounts without name" do
      expect(FactoryBot.build(:account, name: nil).save).to be_falsey
    end
  end
end
