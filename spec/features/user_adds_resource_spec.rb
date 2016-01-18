require "rails_helper"

feature "users can add a new resource" do
  let!(:unit_type) { create(:unit_type) }
  let!(:title) { "RightStart Math Level A" }
  let!(:units) { "325" }

  scenario "user adds new resource successfully" do
    visit new_resource_path
    fill_in 'Title', with: title
    fill_in 'Units', with: units
    select unit_type.name, from: "resource_unit_type_id"

    click_button "Add Resource"

    expect(page).to have_content "Resource added successfully"
    expect(page).to have_content title
  end

  context "user sees errors" do
    scenario "when title is blank" do
      visit new_resource_path
      fill_in 'Units', with: units
      select "Lessons", from: "resource_unit_type_id"
      click_button "Add Resource"

      expect(page).to have_content "Title can't be blank"
    end

    scenario "when units is blank" do
      visit new_resource_path
      fill_in 'Title', with: title
      select unit_type.name, from: "resource_unit_type_id"
      click_button "Add Resource"

      expect(page).to have_content "Units can't be blank"
    end

    scenario "when unit type is blank" do
      visit new_resource_path
      fill_in 'Title', with: title
      fill_in 'Units', with: units
      click_button "Add Resource"

      expect(page).to have_content "Unit type can't be blank"
    end


    scenario "user enters resource that is already in database" do
      resource = create(:resource, unit_type: unit_type)
      visit new_resource_path
      fill_in 'Title', with: resource.title
      fill_in 'Units', with: resource.units
      select unit_type.name, from: "resource_unit_type_id"

      click_button "Add Resource"

      expect(page).to have_content "Title has already been taken"
    end
  end
end
