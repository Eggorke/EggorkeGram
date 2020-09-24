# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }
  let(:params) { { user_id: user } }

  before do
    sign_in user
  end

  describe '#index' do
    subject { get :index, params: params }

    let!(:post) { create :post, user: user }

    it 'assigns @posts' do
      subject
      expect(assigns(:posts)).to eq([post])
    end

    it { is_expected.to render_template('index')}
  end

  describe '#show' do
    let(:params) { { id: post } }
    subject { get :show, params: params}

    let!(:post) { create :post, user: user }

    it 'assigns @post' do
      subject
      expect(assigns(:post)).to eq(post)
    end

    it { is_expected.to render_template(:show) }

    context 'when user tries to see post, that have not been created' do
      let(:params) { { id: post.id + 1 } } # we create post and in params we will serching post with id + 1, which have not been created yet
      let!(:post) { create :post, user: user }

      it { expect { subject {get :show, params: params} }.to raise_error(ActiveRecord::RecordNotFound) }
    end
  end

  describe '#new' do
    subject {get :new, params: params}

    context 'when user signed in' do
      before { sign_in user }

      it { is_expected.to render_template(:new) }

      it 'assigns new post' do
        subject
        expect(assigns(:post)).to be_a_new Post
      end
    end
  end

  describe '#create' do
    let(:params) do
      {
        user_id: user.id,
        post: attributes_for(:post)
      }
    end
    subject { post :create, params: params }

    it 'create post' do
      expect { subject }.to change { Post.count }.by(1)
      is_expected.to redirect_to(posts_path)
    end

    context 'when params invalid' do
      let(:params) do
        { user_id: user.id, post: { title: nil } }
      end

      it { is_expected.to render_template(:new) }
      it { expect {subject}.not_to change { Post.count } }
    end
  end

  describe '#edit' do
    let!(:post) { create :post, user: user }
    let(:params) { { id: post, user_id: user } }
    subject { process :edit, method: :get, params: params }

    it { is_expected.to render_template(:edit) }

    it 'assigns server policy' do
      subject
      expect(assigns(:post)).to eq post
    end

    context 'it disallow to edit not yours posts' do
      let!(:user2) { create :user }
      let!(:post2) { create :post, user: user2 }
      let(:params) { { id: post2, user_id: user }}

      it { is_expected.to redirect_to(root_path) }
    end
  end

  describe '#update' do
    let!(:post) { create :post, user: user }
    let(:params) { { id: post, user_id: user, post: { title: 'some title' } } }

    subject { process :update, method: :put, params: params }

    it { is_expected.to redirect_to(root_path)}

    it 'update post' do
      expect {subject}.to change { post.reload.title }.to('some title')
    end

    context 'with bad params' do
      let(:params) { { id: post, user_id: user, post: { title: '' } } }

      it 'does not update post' do
        expect { subject }.not_to change { post.reload.title }
      end
    end
  end

  describe '#destroy' do
    let!(:post) { create :post, user: user }
    let(:params) { { id: post } }
    subject { process :destroy, method: :delete, params: params }

    it { expect {subject}.to change { Post.count } }

    it { is_expected.to redirect_to posts_path }
  end
end
