require 'rails_helper'

RSpec.describe FollowController, type: :controller do
    let(:current_user) { create :user }
    
    before do
        sign_in current_user
    end

    describe "#follow_user" do
        let!(:user_to_follow){ create :user }
        let(:params){{ follow_id: user_to_follow }}
        subject { post :follow_user, params: params }

        it "should redirect to request referer after follow user" do
            referer_redirect_rspec 
            subject
            is_expected.to redirect_to(request.referer)
        end


        it "should change Follow by +1" do
            referer_redirect_rspec 
            expect { subject }.to change {Follow.count}.by(1)
        end

    end



    describe "#unfollow_user" do

        context "allow to unfollow other users" do
            let!(:user_to_follow){ create :user }
            let(:params_to_follow){{ follow_id: user_to_follow }}
            
            before do
                referer_redirect_rspec
                post :follow_user, params: params_to_follow 
            end
            
            let(:params_to_unfollow){{ unfollow_id: user_to_follow }}
            subject { post :unfollow_user, params: params_to_unfollow }
            

            it "should redirect to referer after unfollow user" do
                referer_redirect_rspec
                subject
                is_expected.to redirect_to(request.referer)
            end


            it "should change Follow by -1" do
                referer_redirect_rspec
                expect { subject }.to change {Follow.count}.by(-1)
            end



        end

    end




    describe "#index" do
        let!(:user_follower){create :user}
        let!(:user_following){create :user}
        let(:params_to_follow){{ follow_id: user_following.id }}

        #current user follow user_following, but user_follower follow current_user
        #смахивает на наркоманию =)
        before do
            referer_redirect_rspec
            post :follow_user, params: params_to_follow
            sign_out current_user
            sign_in user_follower
            post :follow_user, params: { follow_id: current_user.id }
            sign_out user_follower
            sign_in current_user
        end

        subject { get :index }

        it "assigns @followers" do
            subject
            expect(assigns(:followers)).to eq([user_follower])
        end

        it "assigns @followings" do
            subject
            expect(assigns(:following)).to eq([user_following])
        end


    end

    


end