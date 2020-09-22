# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user1) { create :user }

  before do
    sign_in user1
  end

  describe '#show' do
    context 'when user click to his account link' do
      let(:params) {{ id: user1 }}
      subject { get :show, params: params }
      it { is_expected.to redirect_to(root_path) }
    end

    context 'when user click to another user link' do
      let!(:user2) { create :user }
      let(:params) {{ id: user2 }}
      subject { get :show, params: params }
      it { is_expected.to render_template(:show) }
    end
  end
end
