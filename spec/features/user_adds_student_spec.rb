require "rails_helper"

feature "users can add a new student" do
  scenario "user adds new student successfully" do
    visit new_student_path
    fill_in 'Name', with: "Jocelyn"
    click_button "Add Student"

    expect(page).to have_content "Student added successfully"
  end

  scenario "user does not enter name" do
    visit new_student_path
    click_button "Add Student"
    expect(page).to have_content "Name can't be blank"
  end

  scenario "user enters name that is already in database" do
    student = FactoryGirl.create(:student)
    visit new_student_path
    fill_in 'Name', with: student.name

    click_button "Add Student"

    expect(page).to have_content
    "Name has already been taken"
  end
end
