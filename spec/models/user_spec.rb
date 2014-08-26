require 'spec_helper'

describe User, type: :model do

  let(:invite) { Invite.generate }
  let(:valid_attributes) { attributes_for(:user) }

  describe "registration" do

    context "with a code" do

      it {
        expect {
          User.create(valid_attributes)
        }.to change(User, :count).by(1)
      }

      it "should create new invites" do
        user = User.create(valid_attributes)
        expect(user.invites.count).to eq(Invite::COUNT)
      end
    end

    context "without a code" do
      before { valid_attributes.delete(:code) }

      it {
        expect {
          User.create(valid_attributes)
        }.to change(User, :count).by(0)
      }
    end

    context "with an expired code" do
      before do
        valid_attributes.delete(:code)
        invite.expired = true;
        invite.save
      end

      it {
        expect {
          User.create(valid_attributes.merge(code: invite.code))
        }.to change(User, :count).by(0)
      }
    end
  end
end
