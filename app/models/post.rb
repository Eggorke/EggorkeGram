class Post < ApplicationRecord
    include ImageUploader[:image]
    belongs_to :user
    has_many :commentary

    validates :image, presence: true
    validates :title, presence: true
    
end


