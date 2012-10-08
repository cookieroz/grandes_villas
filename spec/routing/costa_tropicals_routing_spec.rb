require "spec_helper"

describe CostaTropicalsController do
  describe "routing" do

    it "routes to #index" do
      get("/costa_tropicals").should route_to("costa_tropicals#index")
    end

    it "routes to #new" do
      get("/costa_tropicals/new").should route_to("costa_tropicals#new")
    end

    it "routes to #show" do
      get("/costa_tropicals/1").should route_to("costa_tropicals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/costa_tropicals/1/edit").should route_to("costa_tropicals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/costa_tropicals").should route_to("costa_tropicals#create")
    end

    it "routes to #update" do
      put("/costa_tropicals/1").should route_to("costa_tropicals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/costa_tropicals/1").should route_to("costa_tropicals#destroy", :id => "1")
    end

  end
end
