class Petition < ApplicationRecord
  belongs_to :user
  has_many :signatures, dependent: :destroy
  has_one_attached :picture
  validates :title, presence: true, length: {maximum: 90}
  validates :description, presence: true
  validates :picture, presence: true
end
