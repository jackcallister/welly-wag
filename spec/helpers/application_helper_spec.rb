require 'spec_helper'

describe ApplicationHelper, type: :helper do

  describe "#display_url" do

    context "with a url" do
      let(:link) { create(:post, url: "http://example.com/foo/bar/baz") }

      it "should remove the protocol and trail" do
        expect(helper.display_url(link)).to eq "(example.com)"
      end
    end

    context "without a url" do
      let(:link) { create(:post, url: nil, description: 'Test') }

      it "should return nil" do
        expect(helper.display_url(link)).to be_nil
      end
    end
  end
end
