class Petition < ApplicationRecord
  include Visible
  
  has_many :comments

  validates :title, presence: true
  validates :description, presence: true
  validates :goal, numericality: {greater_than: 0}
end
