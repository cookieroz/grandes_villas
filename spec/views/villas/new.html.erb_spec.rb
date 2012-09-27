require 'spec_helper'

describe "villas/new" do
  before(:each) do
    assign(:villa, stub_model(Villa,
      :name => "MyString",
      :title => "MyString",
      :content => "MyText"
    ).as_new_record)
  end

  it "renders new villa form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => villas_path, :method => "post" do
      assert_select "input#villa_name", :name => "villa[name]"
      assert_select "input#villa_title", :name => "villa[title]"
      assert_select "textarea#villa_content", :name => "villa[content]"
    end
  end
end
