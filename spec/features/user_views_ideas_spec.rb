require "rails_helper"

RSpec.feature "user views ideas", js: true do
  let!(:idea1) { create(:idea)}
  let!(:idea2) { create(:idea)}

  scenario "that already exist" do

    idea1_identifier = "#idea-#{idea1.id.to_s}"
    idea2_identifier = "#idea-#{idea2.id.to_s}"
  
    visit "/" 

    expect(page).to have_current_path(root_path)

    expect(page).to have_css(idea1_identifier)
    expect(page).to have_css(idea2_identifier)
  end
end
