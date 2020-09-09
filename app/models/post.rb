class Post < ApplicationRecord
    include ImageUploader[:image]
    belongs_to :user
    has_many :commentary
    has_many :likes, dependent: :destroy

    validates :image, presence: true
    validates :title, presence: true
    
end


