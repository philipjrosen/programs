require 'rails_helper'

describe "Editing Programs" do
  let!(:program) { Program.create(title: "Breaking Bad", subtitle: "Adventure of Walt", code: "BBS512") }

  def update_program(options={})
    options[:title] ||= "House of Cards"
    options[:subtitle] ||= "Psychopaths in the Oval Office"
    options[:code] ||= "HCS3E5"

    program = options[:program]

    visit "/programs"
    within "#program_#{program.id}" do
      click_link "Edit"
    end

    fill_in "Title", with: options[:title]
    fill_in "Subtitle", with: options[:subtitle]
    fill_in "Code", with: options[:code]
    click_button "Update Program"
  end

  it "updates a program with correct information" do

    update_program program: program

    program.reload

    expect(page).to have_content("Program was successfully updated.")
    expect(program.title).to eq("House of Cards")
    expect(program.subtitle).to eq("Psychopaths in the Oval Office")
    expect(program.code).to eq("HCS3E5")
  end

  it "displays an error when the program has no title" do
    update_program program: program, title: ""
    title = program.title
    program.reload
    expect(program.title).to eql(title)
    expect(page).to have_content("error")
  end

  it "displays an error when the code is not an alphanumeric string with exactly 6 characters" do
    update_program program: program, code: "HCS3E05"
    expect(page).to have_content("error")
  end
end