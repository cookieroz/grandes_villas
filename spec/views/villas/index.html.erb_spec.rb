require 'spec_helper'

describe "villas/index" do
  before(:each) do
    assign(:villas, [
      stub_model(Villa,
        :name => "Name",
        :title => "Title",
        :content => "MyText"
      ),
      stub_model(Villa,
        :name => "Name",
        :title => "Title",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of villas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
