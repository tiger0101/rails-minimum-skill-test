require "rails_helper"

describe PedsController, type: :controller do

  context "#peds" do
    it "index" do
      get :index
      expect(response.code).to eq "200"
    end
  end
end
