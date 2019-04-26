class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :email, presence: true
  validates :image, file_size: { less_than: 1.megabytes }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable
  has_many :meters
  has_many :appliances
end
