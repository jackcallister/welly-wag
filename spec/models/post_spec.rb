require 'spec_helper'

describe Post do

  describe "#display_url" do

    context "with a url" do
      before { subject.url = "http://example.com/foo/bar/baz" }

      it "should remove the protocol and trail" do
        expect(subject.display_url).to eq "example.com"
      end
    end

    context "without a url" do
      it { expect(subject.display_url).to be_nil }
    end
  end

  describe "#display_url_with_brackets" do
    before { subject.url = "http://example.com/foo/bar/baz" }

    it { expect(subject.display_url_with_brackets).to eq "(example.com)" }
  end
end
