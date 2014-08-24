require 'spec_helper'

describe UsersController, type: :controller do

  let!(:user)   { create(:user) }

  describe "GET show" do
    before { get :show, id: user.id }

    it { expect(response.status).to be(200) }
  end
end
