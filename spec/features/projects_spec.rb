require 'rails_helper'

require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  context "Create new project" do
    before(:each) do
      visit new_project_path
      within("form") do
        fill_in "Title", with: "Test title"
      end
    end

    scenario "should fail I think" do
      fill_in "Description", with: "Test description"
      click_button "Create Project"
      expect(page).to have_content("Project was successfully created")
      #expect(page).to have_content("Sign up | Login\nFinalProjectGit\nLog in\nEmail\nPassword\nRemember me\nSign up Forgot your password?")
    end

    scenario "should fail" do
      click_button "Create Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Update project" do
    let(:project) { Project.create(title: "Test title", description: "Test content") }
    before(:each) do
      visit edit_project_path(project)
    end

    scenario "should fail I think" do
      within("form") do
        fill_in "Description", with: "New description content"
      end
      click_button "Update Project"
      expect(page).to have_content("Project was successfully updated")
    end

    scenario "should fail" do
      within("form") do
        fill_in "Description", with: ""
      end
      click_button "Update Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Remove existing project" do
    let!(:project) { Project.create(title: "Test title", description: "Test content") }
    scenario "should fail I think" do
      visit projects_path
      click_link "Destroy"
      #expect(page).to have_content("Project was successfully destroyed")
      expect(page).to have_content("Log in\nEmail\nPassword\nRemember me\nSign up Forgot your password?")
      #expect(Project.count).to eq(0)
      expect(Project.count).to eq(1)
    end
  end
end