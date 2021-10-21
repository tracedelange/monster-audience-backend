class User < ApplicationRecord

    has_secure_password

    has_many :subjects
    has_many :reviews

    has_many :friendships
    has_many :friends, through: :friendships

    has_many :chat_messages
    has_many :conversations

    validates :username, presence: true
    validates :username, length: {minimum: 2, maximum: 15}
    validates :username, uniqueness: { case_sensitive: false, message: "Username already taken."}
    
end
