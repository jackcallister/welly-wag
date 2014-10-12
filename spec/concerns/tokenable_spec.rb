require 'spec_helper'

shared_examples_for "tokenable" do
  let(:model) { described_class }
  let(:instance) { FactoryGirl.create(model.to_s.underscore.to_sym) }

  it { expect(model).to respond_to(:find_by_access_token) }
  it { expect(instance).to respond_to(:access_token) }

  describe "#access_token" do
    context "when instance has not been persisted" do
      subject { model.new }
      it { expect { subject.access_token }.to raise_error(Tokenable::RecordNotPersistedError) }
    end

    context "when instance has been persisted" do
      it { expect(instance.access_token).to_not be_nil }
    end
  end

  describe ".find_by_access_token" do
    context "with invalid token" do
      it { expect(model.find_by_access_token("123")).to be_nil }
    end

    context "with a generated token" do
      let(:token) { instance.access_token }
      it { expect(model.find_by_access_token(token)).to eq(instance) }
    end
  end

end
