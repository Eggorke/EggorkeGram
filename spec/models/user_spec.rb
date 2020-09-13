require 'rails_helper'

RSpec.describe User, type: :model do
    subject { build(:user) }
    it { should have_many(:posts) }
    it { should have_many(:commentary) }
    it { should have_many(:likes) }
    it { should validate_presence_of (:email) }
    it { should validate_presence_of (:name) }
end