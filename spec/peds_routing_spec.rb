require "rails_helper"

describe PedsController, type: :routing do
  describe 'routing' do
    it 'peds' do
      expect(get: '/peds').to route_to({"locale"=>"en", "controller"=>"peds", "action"=>"index"})
    end
  end
end
