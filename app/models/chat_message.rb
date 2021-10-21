class ChatMessage < ApplicationRecord


    belongs_to :conversation

    after_create_commit do
        # ChatMessageCreationEventBroadcastJob.perform_later(self.to_json)
        puts self
        ChatMessageCreationEventBroadcastJob.perform_later({chat_messages: Conversation.find(self.conversation_id).chat_messages}.to_json, self.conversation_id)
    end
end
