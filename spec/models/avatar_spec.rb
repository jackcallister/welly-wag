require 'spec_helper'

describe Avatar do

  describe "#url" do

    context "with no gravatar" do

      it { expect(Avatar.new('example@example.com').url).to be_nil }
    end

    context "with gravatar" do

      it { expect(Avatar.new('jarsbe@gmail.com').url).to be_truthy }
    end
  end
end