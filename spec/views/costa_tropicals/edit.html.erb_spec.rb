require 'spec_helper'

describe "costa_tropicals/edit" do
  before(:each) do
    @costa_tropical = assign(:costa_tropical, stub_model(CostaTropical))
  end

  it "renders the edit costa_tropical form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => costa_tropicals_path(@costa_tropical), :method => "post" do
    end
  end
end
