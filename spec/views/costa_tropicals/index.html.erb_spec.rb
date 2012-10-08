require 'spec_helper'

describe "costa_tropicals/index" do
  before(:each) do
    assign(:costa_tropicals, [
      stub_model(CostaTropical),
      stub_model(CostaTropical)
    ])
  end

  it "renders a list of costa_tropicals" do
    render
  end
end
