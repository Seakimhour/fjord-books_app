# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  attr_accessor :followed

  has_many :follower_follows, foreign_key: :following_id, class_name: 'Follow', dependent: :destroy, inverse_of: false
  has_many :followers, through: :follower_follows, source: :follower, dependent: :destroy

  has_many :following_follows, foreign_key: :follower_id, class_name: 'Follow', dependent: :destroy, inverse_of: false
  has_many :followings, through: :following_follows, source: :following, dependent: :destroy
end
