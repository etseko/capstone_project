class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :email, presence: true
  validates :image, file_size: { less_than: 1.megabytes }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :meters
  has_many :appliances
end
