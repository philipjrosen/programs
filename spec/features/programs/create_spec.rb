require 'rails_helper'

describe "Creating Programs" do
  it "redirects to the programs index page on success" do
    visit "/programs"
    click_link "New Program"
    expect(page).to have_content("New Program")

    fill_in "Title", with: "Mad Men"
    fill_in "Subtitle", with: "The 1960s"
    fill_in "Code", with: "madmen"
    click_button "Create Program"
    expect(page).to have_content("Mad Men")
  end

  it "displays an error when the program has not title" do
    expect(Program.count).to eql(0)

    visit "/programs"
    click_link "New Program"
    expect(page).to have_content("New Program")

    fill_in "Title", with: ""
    fill_in "Subtitle", with: "The 1960s"
    fill_in "Code", with: "madmen"
    click_button "Create Program"

    expect(page).to have_content("error")
    expect(Program.count).to eql(0)

    visit "/programs"
    expect(page).to_not have_content("The 1960s")
  end
end