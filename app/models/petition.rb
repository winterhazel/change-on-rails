class Petition < ApplicationRecord
  include Visible

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :goal, numericality: {greater_than: 0}
end
