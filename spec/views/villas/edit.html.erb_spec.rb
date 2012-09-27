require 'spec_helper'

describe "villas/edit" do
  before(:each) do
    @villa = assign(:villa, stub_model(Villa,
      :name => "MyString",
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit villa form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => villas_path(@villa), :method => "post" do
      assert_select "input#villa_name", :name => "villa[name]"
      assert_select "input#villa_title", :name => "villa[title]"
      assert_select "textarea#villa_content", :name => "villa[content]"
    end
  end
end
