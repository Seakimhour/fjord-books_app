class Report < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true

    has_many :comments, as: :commentable

    belongs_to :user
end
