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

  describe "#avatar_url" do

    subject { build(:user, avatar_url: nil) }

    context "with a gravatar" do

      before  { subject.email = 'jarsbe@gmail.com'; subject.save }

      it "should return a gravatar url" do
        expect(subject.avatar_url).to eq("http://www.gravatar.com/avatar/" + Digest::MD5.hexdigest(subject.email))
      end
    end

    context "without a gravatar" do

      before  { subject.email = 'example@example.com'; subject.save }

      it "should return a default avatar url" do
        expect(Avatar.default_urls.include? subject.avatar_url).to eq(true)
      end
    end
  end
end
