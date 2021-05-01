require 'rails_helper'
require 'support/controller_macros'

RSpec.feature "Projects", type: :feature do
 
  it "Check that student can log in" do
    visit root_path
    click_link "Sign up"
    fill_in "Email", with: "me@yourface.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    click_link "Logout"
    click_link "Login"
    fill_in "Email", with: "me@yourface.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    expect(page).to have_content('Signed in successfully.')
  end

  describe "Create new project" do

    before(:each) do
      visit root_path
      click_link "Sign up"
      fill_in "Email", with: "me@yourface.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_button "Sign up"
      visit new_project_path
      within("form") do
        fill_in "Title", with: "Test title"
      end
    end

    scenario "should be successful" do

      fill_in "Body", with: "Test body"
      click_button "Create Project"
      expect(page).to have_content("Project was successfully created")
    end

    scenario "should fail" do
      click_button "Create Project"
      expect(page).to have_content("Body can't be blank")
    end
  end

  context "Update project" do
    let(:project) { Project.create(title: "Test title", body: "Test content") }
    before(:each) do
      visit root_path
      click_link "Sign up"
      fill_in "Email", with: "me@yourface.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_button "Sign up"
      visit edit_project_path(project)
    end

    scenario "should be successful" do
      within("form") do
        fill_in "Body", with: "New body content"
      end
      click_button "Update Project"
      expect(page).to have_content("Project was successfully updated")
    end

    scenario "should fail" do
      within("form") do
        fill_in "Body", with: ""
      end
      click_button "Update Project"
      expect(page).to have_content("Body can't be blank")
    end
  end

  context "Remove existing project" do
    let!(:project) { Project.create(title: "Test title", body: "Test content") }
    scenario "remove project" do
      visit root_path
      click_link "Sign up"
      fill_in "Email", with: "me@yourface.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_button "Sign up"
      visit projects_path
      click_link "Destroy"
      expect(page).to have_content("Project was successfully destroyed")
      expect(Project.count).to eq(0)
    end
  end
end