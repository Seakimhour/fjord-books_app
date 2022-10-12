# frozen_string_literal: true

class Report < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  has_many :comments, as: :commentable, dependent: :destroy

  belongs_to :user
end
