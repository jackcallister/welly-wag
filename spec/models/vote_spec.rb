require 'spec_helper'

describe Vote, type: :model do

  let(:post) { create(:post) }
  let(:user) { create(:user) }

  describe "uniqueness validation" do

    context "where user has not voted for post" do

      it "should create a vote" do

        expect {
          post.votes.build(user: user)
          post.save
        }.to change(Vote, :count).by 1
      end
    end

    context "where user has already voted for post" do
      before do
        post.votes.build(user: user)
        post.save
      end

      it "should not create a new vote" do

        expect {
          post.votes.build(user: user)
          post.save
        }.to change(Vote, :count).by 0
      end
    end
  end
end
