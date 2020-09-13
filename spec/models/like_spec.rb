require 'rails_helper'

RSpec.describe Like, type: :model do

    
    it { should belong_to(:user) }
    it { should belong_to(:post) }

    
    
    context "validate user like" do
        

        it "should be valid like" do
            user = create(:user)
            post = create(:post)
            subject.user_id = user.id
            subject.post_id = post.id
            should be_valid
        end

        it "should validate uniqeness" do
            should validate_uniqueness_of(:user_id).scoped_to(:post_id)
        end



    end


end