require "rails_helper"

feature "users can add a new curriculum for student" do
  let(:unit_type) { create(:unit_type) }
  let(:division_type) { create(:division_type) }
  let(:subject) { create(:subject) }
  let!(:resource) { create(:resource, unit_type: unit_type, subject: subject) }
  let(:student) { create(:student) }

  scenario "user adds new resource successfully" do
    visit student_curriculums_path(student)
    select resource.title, from: "curriculum_resource_id"

    click_button "Add Curriculum"

    expect(page).to have_content "Curriculum added successfully"
    expect(page).to have_content resource.title
  end

  scenario "user sees errors when no resource is selected" do
    visit student_curriculums_path(student)
    click_button "Add Curriculum"

    expect(page).to have_content "Resource can't be blank"
  end
end
