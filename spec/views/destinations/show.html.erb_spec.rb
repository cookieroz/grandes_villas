require 'spec_helper'

describe "destinations/show" do
  before(:each) do
    @destination = assign(:destination, stub_model(Destination))
  end

  it "renders attributes in <p>" do
    render
  end
end
