class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_one_attached :image
  validates :name, presence: true
  validates :title, presence: true
end
