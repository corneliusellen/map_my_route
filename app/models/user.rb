class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  enum role: ["default", "admin"]

  has_many :vehicles
  has_many :favorites
  has_many :stations, through: :favorites
end
