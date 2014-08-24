require 'spec_helper'

describe User, type: :model do

  let(:user) { create(:user) }
  let(:post) { create(:post) }

  subject { user }

  describe "#can_vote?(post)" do

    context "with a vote" do
      before { subject.votes.build(post: post).save }

      it { expect(subject.can_vote?(post)).to be(false) }
    end

    context "without a vote" do
      it { expect(subject.can_vote?(post)).to be(true) }
    end
  end
end
