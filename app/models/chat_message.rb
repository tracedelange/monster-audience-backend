class ChatMessage < ApplicationRecord


    belongs_to :conversation
    belongs_to :author, :class_name => "User"

    after_create_commit do
        messages = Conversation.find(self.conversation_id).chat_messages
        ChatMessageCreationEventBroadcastJob.perform_later({chat_messages: ActiveModel::Serializer::CollectionSerializer.new(messages, each_serializer: ChatMessageSerializer)}.to_json, self.conversation_id)
    end
    # subjects: ActiveModel::Serializer::CollectionSerializer.new(owned_subjects, each_serializer: SubjectSerializer)
end
