class Idea < ApplicationRecord 
  belongs_to :user
  validates :description, :author, :user_id, presence: true
end
