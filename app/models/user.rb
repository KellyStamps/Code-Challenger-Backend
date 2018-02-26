class User < ApplicationRecord
  # has_secure_password
  validates :name, presence: true
  validates :password, presence: true

  has_many :user_challenges
  has_many :challenges, through: :user_challenges
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

end
