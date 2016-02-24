require "rails_helper"

RSpec.describe API::V1::MessagesController, type: :routing do
  describe "routing" do
    it { expect(get:  "/").to route_to("statistics#index") }
  end
end