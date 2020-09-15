require 'rails_helper'

RSpec.describe LikesController, type: :controller do
    let(:user) { create :user }
    

    before do
        sign_in user
    end

    describe "#like" do
    
        let!(:post) { create :post }
        let(:params) {{ user_id: user, post_id: post }}
        subject { get :like, params: params } 

        it "should redirect to request referer after putting LIKE" do
            request.env['HTTP_REFERER'] = 'http://localhost:3000' #Долго гуглил... но нагуглил ^_^ иначе не возвращает request referer из контроллера
            subject
            is_expected.to redirect_to(request.referer)
        end
        
    end


    describe "#unlike" do
        let!(:post) { create :post }
        let(:like_params) {{ post_id: post, user_id: user }}
        let!(:like) { create :like, post_id: post.id, user_id: user.id }

        subject { process :unlike, method: :delete, params: like_params }

        it "should redirect to request referer after DISLIKE" do
            request.env['HTTP_REFERER'] = 'http://localhost:3000'
            subject
            is_expected.to redirect_to(request.referer)
        end


    end


end