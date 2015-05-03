require 'rails_helper'

describe "Creating Programs" do
  def create_program(options={})
    options[:title] ||= "Mad Men"
    options[:subtitle] ||= "The 1960s"
    options[:code] ||= "mms712"

    visit "/programs"
    click_link "New Program"
    expect(page).to have_content("New Program")

    fill_in "Title", with: options[:title]
    fill_in "Subtitle", with: options[:subtitle]
    fill_in "Code", with: options[:code]
    click_button "Create Program"
  end

  it "redirects to the programs index page on success" do
    create_program
    expect(page).to have_content("Mad Men")
  end

  it "displays an error when the program has not title" do
    expect(Program.count).to eql(0)

    create_program title: ""

    expect(page).to have_content("error")
    expect(Program.count).to eql(0)

    visit "/programs"
    expect(page).to_not have_content("The 1960s")
  end

  it "displays an error when the code is not an alphanumeric string with exactly 6 characters" do
    expect(Program.count).to eql(0)

    create_program code: "mms0712"
    
    expect(page).to have_content("error")
    expect(Program.count).to eql(0)

    visit "/programs"
    expect(page).to_not have_content("The 1960s")
  end
end
