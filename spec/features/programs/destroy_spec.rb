require 'rails_helper'

describe "Deleting Programs" do
  let!(:program) { Program.create(title: "Breaking Bad", subtitle: "Adventure of Walt", code: "BBS512") }

  it "successfully deletes a program when the destroy link is clicked" do
    visit "/programs"
    within "#program_#{program.id}" do
      click_link "Destroy"
    end
    expect(page).to_not have_content(program.title)
    expect(Program.count).to eql(0)
  end
end