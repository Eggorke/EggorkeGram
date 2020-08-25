class Post < ApplicationRecord
    include ImageUploader[:image]
    belongs_to :user

    validates :image, presence: true
    validates :title, presence: true
end


