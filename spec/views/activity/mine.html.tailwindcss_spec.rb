require 'rails_helper'

RSpec.describe "activity/mine.html.tailwindcss", type: :view do
  it "renders with word mine" do
    render template: 'activity/mine'
    expect(rendered).to match(/mine/)
  end
end
