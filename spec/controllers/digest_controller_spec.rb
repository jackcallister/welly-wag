require 'spec_helper'

describe DigestController, type: :controller do

  let(:user) { create(:user) }

  describe "GET unsubscribe" do

    context "with invalid params" do
      before { get :unsubscribe, signature: "123" }
      it { expect(response.status).to eq(200) }
      it { expect(response).to render_template('users/digest/unsubscribe_error') }
    end

    context "with valid params" do
      before { get :unsubscribe, signature: user.access_token }
      subject { User.find(user.id) }
      it { expect(response.status).to eq(200) }
      it { expect(subject.send_digest).to be false }
      it { expect(response).to render_template('users/digest/unsubscribe_success') }
    end
  end
end

