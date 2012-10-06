require 'spec_helper'

describe "activities/edit" do
  before(:each) do
    @activity = assign(:activity, stub_model(Activity,
      :activity => "MyString",
      :content => "MyText",
      :activity_image => "MyString"
    ))
  end

  it "renders the edit activity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => activities_path(@activity), :method => "post" do
      assert_select "input#activity_activity", :name => "activity[activity]"
      assert_select "textarea#activity_content", :name => "activity[content]"
      assert_select "input#activity_activity_image", :name => "activity[activity_image]"
    end
  end
end
