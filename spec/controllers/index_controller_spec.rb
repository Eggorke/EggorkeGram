require 'rails_helper'

RSpec.describe IndexController, type: :controller do
    let(:user) { create :user }



    describe "#home" do
        subject { get :home }
        let!(:post) { create :post, user: user }
        
        it "assigns @posts" do
            subject
            expect(assigns(:posts)).to eq([post])
        end 

    end


end