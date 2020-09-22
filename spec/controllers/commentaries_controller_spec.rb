# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentariesController, type: :controller do
  let(:user) { create :user }

  before do
    sign_in user
  end

  describe '#create' do
    let!(:post) { create :post }
    let(:params) do
      {

        commentary: { user_id: user.id, post_id: post.id, commentary_text: 'Some' }
      }
    end

    # так и не понял почему метод post просит 0 аргументов, а с методом get все работает, спроси у наставников
    subject { get :create, params: params }

    it 'should redirect to posts and change count of commentaries by 1' do
      expect { subject }.to change { Commentary.count }.by(1)
      is_expected.to redirect_to(posts_path)
    end
  end
end
