require "rails_helper"

RSpec.describe API::V1::MessagesController, type: :routing do
  describe "routing" do
    it { expect(get:  "/api/v1/messages").to route_to("api/v1/messages#index", format: :json) }
    it { expect(post: "/api/v1/messages").to route_to("api/v1/messages#create", format: :json) }
  end
end