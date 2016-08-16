require "rails_helper"

RSpec.feature "user views ideas", js: true do
  scenario "that already exist" do
    idea1 = create(:idea)
    idea2 = create(:idea)
  
    visit root_path 
  
    expect(page).to have_current_path(root_path)

    expect(page).to have_content idea1.title
    expect(page).to have_content idea1.body
    expect(page).to have_content idea1.quality
  end
end
