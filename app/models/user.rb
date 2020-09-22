# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include ImageUploader[:image]
  include PgSearch::Model
  pg_search_scope :find_by_name,
                  against: :name,
                  using: {
                    tsearch: { prefix: true }
                  }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :commentary, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true # , uniqueness: true

  acts_as_followable
  acts_as_follower
end
