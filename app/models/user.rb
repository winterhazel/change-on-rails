# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :petitions, dependent: :destroy
  has_many :signatures, dependent: :destroy
  has_one_attached :avatar
  validates :name, presence: true
  validates :surname, presence: true

  def remember_me
    super.nil? ? true : super
  end
end
