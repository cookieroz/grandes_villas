require 'spec_helper'

describe "costa_tropicals/new" do
  before(:each) do
    assign(:costa_tropical, stub_model(CostaTropical).as_new_record)
  end

  it "renders new costa_tropical form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => costa_tropicals_path, :method => "post" do
    end
  end
end
