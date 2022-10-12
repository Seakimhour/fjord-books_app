# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :follower_follows, foreign_key: :following_id, class_name: 'Follow', dependent: :destroy, inverse_of: :following
  has_many :followers, through: :follower_follows, source: :follower, dependent: :destroy

  has_many :following_follows, foreign_key: :follower_id, class_name: 'Follow', dependent: :destroy, inverse_of: :follower
  has_many :followings, through: :following_follows, source: :following, dependent: :destroy

  def followed_by?(user)
    follower_follows.where(follower_id: user.id).exists?
  end
end
