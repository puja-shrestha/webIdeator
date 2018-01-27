class User < ApplicationRecord
  has_many :ideas
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  mount_uploader :photo, PhotoUploader
end