class Conversation < ApplicationRecord
    belongs_to :user
    belongs_to :recipient, :class_name => "User"

    has_many :chat_messages

    validates :recipient_id, presence: true
end
