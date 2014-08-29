require 'spec_helper'

describe Invite, :type => :model do

  describe ".generate" do

    it {
      expect {
        Invite.generate
      }.to change(Invite, :count).by(1)
    }

    it { expect(Invite.generate.code).to be_truthy }
  end
end
