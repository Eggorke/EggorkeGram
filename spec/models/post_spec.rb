require 'rails_helper'

RSpec.describe Post, type: :model do
    it { should belong_to(:user) }
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(100) }


    context 'validates image format' do
        it "allows to set png file as an image" do
            user = create(:user)
            subject.attributes = attributes_for(:post)
            subject.user = user
            should be_valid
        end

        it "disallow to set txt file as an image" do
            user = create(:user)
            subject.attributes = attributes_for(:post,  :with_invalid_image)
            subject.user = user
            should be_invalid
        end

    end


end