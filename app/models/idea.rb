class Idea < ApplicationRecord ::Base
  validates :description, :author, presence: true
end
