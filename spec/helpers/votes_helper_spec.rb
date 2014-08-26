require 'spec_helper'

describe VotesHelper, type: :helper do

  let(:link) { create(:post) }
  let(:user) { create(:user) }

  describe "#vote_form(resource)" do

    context "sign in" do
      before { sign_in user }

      context "can vote" do
        it "should render the up vote form" do
          expect(helper).to receive(:render).with('votes/up', voteable: link)
          helper.vote_form(link)
        end
      end

      context "can't vote" do
        before { create(:vote, user: user, voteable_id: link.id, voteable_type: 'Post') }

        it "should render the voted partial" do
          expect(helper).to receive(:render).with('votes/voted')
          helper.vote_form(link)
        end
      end
    end

    context "signed out" do
      it "should render the up vote form" do
        expect(helper).to receive(:render).with('votes/up', voteable: link)
        helper.vote_form(link)
      end
    end
  end
end
