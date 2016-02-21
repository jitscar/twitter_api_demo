require "rails_helper"

RSpec.describe API::V1::MessagesController, type: :routing do
  describe "routing" do
    it { expect(get:  "/api/v1/messages").to route_to("api/v1/messages#index", format: :json) }
    it { expect(post: "/api/v1/messages").to route_to("api/v1/messages#create", format: :json) }
    it { expect(put: "/api/v1/messages/1/mark_as_liked").to route_to("api/v1/messages#mark_as_liked", id: "1", format: :json) }
  end
end