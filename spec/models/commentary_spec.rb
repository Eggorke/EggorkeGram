# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Commentary, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:post) }
  it { should validate_presence_of(:post_id) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:commentary_text) }
  it { should validate_length_of(:commentary_text).is_at_most(200) }
end
