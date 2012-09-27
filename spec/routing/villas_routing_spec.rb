require "spec_helper"

describe VillasController do
  describe "routing" do

    it "routes to #index" do
      get("/villas").should route_to("villas#index")
    end

    it "routes to #new" do
      get("/villas/new").should route_to("villas#new")
    end

    it "routes to #show" do
      get("/villas/1").should route_to("villas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/villas/1/edit").should route_to("villas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/villas").should route_to("villas#create")
    end

    it "routes to #update" do
      put("/villas/1").should route_to("villas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/villas/1").should route_to("villas#destroy", :id => "1")
    end

  end
end
