class User < ApplicationRecord
    has_many :subjects
    has_many :reviews
end
