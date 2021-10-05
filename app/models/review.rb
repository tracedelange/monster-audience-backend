class Review < ApplicationRecord
    belongs_to :subject
    belongs_to :user

    validates :subject_id, presence: true
    validates :content, presence: true
    validates :rating, presence: true
end
