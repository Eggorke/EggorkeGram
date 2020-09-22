# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :post do
    association :user

    title { Faker::Lorem.sentence }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.png')) }

    trait(:with_invalid_image) do
      image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/fail.txt'))}
    end
  end
end
