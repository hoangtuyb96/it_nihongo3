class Book < ApplicationRecord
  ratyrate_rateable "quality"

	mount_base64_uploader :picture, PhotoBookUploader
	belongs_to :user
  belongs_to :category
	has_many :reviews
  has_many :likes
  has_many :liked_user, through: :likes, source: :user
	validates :user, presence: true
end
