# frozen_string_literal: true

require_relative "../support/isolation_spec_helper"

RSpec.describe "Without validations" do
  it "doesn't load Hanami::Validations" do
    expect(defined?(Hanami::Validations)).to be(nil)
  end

  it "doesn't load Hanami2::Action::Validatable" do
    expect(defined?(Hanami2::Action::Validatable)).to be(nil)
  end

  it "doesn't have Hanami2::Action.params" do
    expect do
      Class.new(Hanami2::Action) do
        params do
          required(:id).filled
        end
      end
    end.to raise_error(
      NoMethodError,
      %(To use `.params`, please add the "hanami-validations" gem to your Gemfile)
    )
  end

  it "doesn't have Hanami2::Action.contract" do
    expect do
      Class.new(Hanami2::Action) do
        contract do
          params do
            required(:id).filled
          end
        end
      end
    end.to raise_error(
      NoMethodError,
      %(To use `.contract`, please add the "hanami-validations" gem to your Gemfile)
    )
  end

  it "doesn't have Hanami2::Action::Params.params" do
    expect do
      Class.new(Hanami2::Action::Params) do
        params do
          required(:id).filled
        end
      end
    end.to raise_error(
      NoMethodError,
      %(To use `.params`, please add the "hanami-validations" gem to your Gemfile)
    )
  end

  it "has params that are always valid" do
    action = Class.new(Hanami2::Action) do
      def handle(req, res)
        res.body = [req.params.respond_to?(:valid?), req.params.valid?]
      end
    end

    response = action.new.call({})
    expect(response.body).to eq(["[true, true]"])
  end
end

RSpec::Support::Runner.run
