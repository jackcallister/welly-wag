require 'spec_helper'

describe CommentsController, type: :controller do

  let(:link) { create(:post) }
  let(:user) { create(:user) }
  let(:comment) { create(:comment, parent_type: 'Post', parent_id: link.id) }

  describe "GET show" do

    context "signed in" do
      before { sign_in user; get :show, { id: comment.id } }
      it { expect(response.status).to eq(200) }
      it { expect(assigns(:comment)).to eq(comment) }
    end

    context "signed out" do
      before { get :show, { id: comment.id } }
      it { expect(subject).to redirect_to(new_user_session_path) }
    end
  end

  describe "POST create" do

    context "signed in" do
      before { sign_in user }

      context "with valid params" do
        it {
          expect {
            post :create, comment: { post_id: link.id, content: 'Test comment.', parent_type: 'Post', parent_id: link.id }
          }.to change(Comment, :count).by (1)
        }
      end

      context "with invalid params" do
        it {
          expect {
            post :create, comment: { post_id: link.id, content: '', parent_type: 'Post', parent_id: link.id }
          }.to change(Comment, :count).by (0)
        }
      end
    end

    context "signed out" do
      before { post :create }
      it { expect(subject).to redirect_to(new_user_session_path) }
    end
  end
end
