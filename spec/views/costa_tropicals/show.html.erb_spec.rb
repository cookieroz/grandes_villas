require 'spec_helper'

describe "costa_tropicals/show" do
  before(:each) do
    @costa_tropical = assign(:costa_tropical, stub_model(CostaTropical))
  end

  it "renders attributes in <p>" do
    render
  end
end
