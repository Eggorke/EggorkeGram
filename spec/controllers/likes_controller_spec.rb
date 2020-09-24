# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let(:user) { create :user }

  before do
    sign_in user
  end

  describe '#like' do
    let!(:post) { create :post }
    let(:params) {{ user_id: user, post_id: post }}
    subject { process :like, method: :post, params: params }

    it 'should redirect to request referer after putting LIKE' do
      referer_redirect_rspec
      subject
      is_expected.to redirect_to(request.referer)
    end

    it 'should change Like count by +1' do
      referer_redirect_rspec
      expect { subject }.to change { Like.count }.by(1)
    end
  end

  describe '#unlike' do
    let!(:post) { create :post }
    let(:like_params) {{ post_id: post, user_id: user }}
    let!(:like) { create :like, post_id: post.id, user_id: user.id }

    subject { process :unlike, method: :delete, params: like_params }

    it 'should redirect to request referer after DISLIKE' do
      referer_redirect_rspec
      subject
      is_expected.to redirect_to(request.referer)
    end

    it 'should change Like count by -1' do
      referer_redirect_rspec
      expect { subject }.to change { Like.count }.by(-1)
    end
  end
end
