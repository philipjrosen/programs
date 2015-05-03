require 'rails_helper'

RSpec.describe "programs/edit", type: :view do
  before(:each) do
    @program = assign(:program, Program.create!(
      :title => "MyString",
      :subtitle => "MyString",
      :code => "MyString"
    ))
  end

  it "renders the edit program form" do
    render

    assert_select "form[action=?][method=?]", program_path(@program), "post" do

      assert_select "input#program_title[name=?]", "program[title]"

      assert_select "input#program_subtitle[name=?]", "program[subtitle]"

      assert_select "input#program_code[name=?]", "program[code]"
    end
  end
end
