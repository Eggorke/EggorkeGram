# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :commentary do
    association :user
    association :post

    commentary_text { Faker::Lorem.sentence }
  end
end
