require "spec_helper"

describe CountriesController do
  describe "routing" do

    it "routes to #index" do
      get("/countries").should route_to("countries#index")
    end

    it "routes to #new" do
      get("/countries/new").should route_to("countries#new")
    end

    it "routes to #show" do
      get("/countries/1").should route_to("countries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/countries/1/edit").should route_to("countries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/countries").should route_to("countries#create")
    end

    it "routes to #update" do
      put("/countries/1").should route_to("countries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/countries/1").should route_to("countries#destroy", :id => "1")
    end

  end
end
