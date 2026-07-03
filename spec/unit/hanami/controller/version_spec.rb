# frozen_string_literal: true

RSpec.describe "Hanami2::Controller::VERSION" do
  it "returns current version" do
    expect(Hanami2::Controller::VERSION).to eq("2.2.0")
  end
end
