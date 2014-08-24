require 'spec_helper'

describe PostsController, type: :controller do

  let(:user)   { create(:user) }
  let!(:link)  { create(:post, user: user) }
  let!(:links) { create_list(:post, 4) }

  describe "GET index" do
    before { get :index }

    it { expect(assigns(:posts).count).to eq(5) }
  end

  describe "GET new" do

    context "signed in" do
      before { sign_in user; get :new }
      it { expect(response.status).to eq(200) }
    end

    context "signed out" do
      before { get :new }
      it { expect(subject).to redirect_to(new_user_session_path) }
    end
  end

  describe "POST create" do

    context "valid attributes" do
      before { sign_in user }

      it {
        expect {
          post :create, { post: { title: 'test' } }
        }.to change(Post, :count).by (1)
      }
    end

    context "invalid attributes" do
      before { sign_in user }

      it {
        expect {
          post :create, { post: { title: '' } }
        }.to change(Post, :count).by (0)
      }
    end

    context "not signed in" do
      before { post :create, post: { title: 'test' } }
      it { expect(subject).to redirect_to(new_user_session_path) }
    end
  end

  describe "GET show" do
    before { get :show, id: link.id }
    it { expect(response.status).to eq(302) }
  end

  describe "DELETE destroy" do

    context "signed in" do

      before { sign_in user }

      it {
        expect {
          delete :destroy, { id: link }
        }.to change(Post, :count).by (-1)
      }
    end

    context "not signed in" do

      it {
        expect {
          delete :destroy, { id: link }
        }.to change(Post, :count).by (0)
      }
    end
  end
end
