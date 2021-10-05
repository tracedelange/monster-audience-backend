class Subject < ApplicationRecord
    has_many :reviews

    validates :name, presence: true
    validates :description, presence: true
    validates :name, uniqueness: { case_sensitive: false, message: "Event already exists."}
end
