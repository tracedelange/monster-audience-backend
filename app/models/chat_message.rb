class ChatMessage < ApplicationRecord
    after_create_commit do
        ChatMessageCreationEventBroadcastJob.perform_later(self.to_json)
    end
end
