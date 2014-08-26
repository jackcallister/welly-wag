require 'spec_helper'

describe User, type: :model do

  let(:invite) { Invite.generate }
  let(:valid_attributes) { attributes_for(:user) }

  describe "registration" do

    context "with a code" do

      it {
        expect {
          User.create(valid_attributes.merge(code: invite.code))
        }.to change(User, :count).by(1)
      }

      it "should create new invites" do
        user = User.create(valid_attributes.merge(code: invite.code))
        expect(user.invites.count).to eq(Invite::COUNT)
      end
    end

    context "without a code" do

      it {
        expect {
          User.create(valid_attributes)
        }.to change(User, :count).by(0)
      }
    end

    context "with an expired code" do
      before { invite.expired = true; invite.save }

      it {
        expect {
          User.create(valid_attributes.merge(code: invite.code))
        }.to change(User, :count).by(0)
      }
    end
  end
end
