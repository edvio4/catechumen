require "rails_helper"

feature "users can add a new resource" do
  let!(:unit_type) { create(:unit_type) }
  let!(:division_type) { create(:division_type) }
  let!(:subject) { create(:subject) }
  let(:title) { "RightStart Math Level A" }
  let(:units) { "325" }

  scenario "user adds new resource successfully" do
    visit new_resource_path
    fill_in 'Title', with: title
    fill_in 'Units', with: units
    select unit_type.name, from: "resource_unit_type_id"
    select subject.name, from: "resource_subject_id"

    click_button "Add Resource"

    expect(page).to have_content "Resource added successfully"
    expect(page).to have_content title
  end

  context "user sees errors" do
    scenario "when title is blank" do
      visit new_resource_path
      fill_in 'Units', with: units
      select unit_type.name, from: "resource_unit_type_id"
      select subject.name, from: "resource_subject_id"
      click_button "Add Resource"

      expect(page).to have_content "Title can't be blank"
    end

    scenario "when units is blank" do
      visit new_resource_path
      fill_in 'Title', with: title
      select unit_type.name, from: "resource_unit_type_id"
      select subject.name, from: "resource_subject_id"
      click_button "Add Resource"

      expect(page).to have_content "Units can't be blank"
    end

    scenario "when unit type is blank" do
      visit new_resource_path
      fill_in 'Title', with: title
      fill_in 'Units', with: units
      select subject.name, from: "resource_subject_id"
      click_button "Add Resource"

      expect(page).to have_content "Unit type can't be blank"
    end

    scenario "when no subject is selected" do
      visit new_resource_path
      fill_in 'Title', with: title
      fill_in 'Units', with: units
      select unit_type.name, from: "resource_unit_type_id"

      click_button "Add Resource"

      expect(page).to have_content "Subject can't be blank"
    end

    scenario "user enters resource that is already in database" do
      resource = create(:resource, unit_type: unit_type, subject: subject)
      visit new_resource_path
      fill_in 'Title', with: resource.title
      fill_in 'Units', with: resource.units
      select subject.name, from: "resource_subject_id"
      select unit_type.name, from: "resource_unit_type_id"

      click_button "Add Resource"

      expect(page).to have_content "Title has already been taken"
    end

    scenario "user enters division units but selects no division type" do
      visit new_resource_path
      fill_in 'Title', with: title
      fill_in 'Units', with: units
      select unit_type.name, from: "resource_unit_type_id"
      select subject.name, from: "resource_subject_id"
      fill_in 'Division units', with: units

      click_button "Add Resource"

      expect(page).to have_content "You entered division units, but forgot to select a division type"
    end

    scenario "user selects division type but enters no division units" do
      visit new_resource_path
      fill_in 'Title', with: title
      fill_in 'Units', with: units
      select unit_type.name, from: "resource_unit_type_id"
      select subject.name, from: "resource_subject_id"
      select division_type.name, from: "resource_division_type_id"

      click_button "Add Resource"

      expect(page).to have_content "You selected a division type, but forgot to enter the division units"
    end
  end
end
