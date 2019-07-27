class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :share
  validates :description, presence: true
end
