require 'rails_helper'

RSpec.describe SearchController, type: :controller do
    let!(:user){create :user}
    let!(:test_user){create :user}
    let(:params){{ name: test_user.name }}
    before { sign_in user }

    describe "#search" do
        subject { get :search, params: params}
        it "should assigns @searched_users" do
            subject
            expect(assigns(:searched_users)).to eq([test_user])
        end
    end



end