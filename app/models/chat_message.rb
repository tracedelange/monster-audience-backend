class ChatMessage < ApplicationRecord


    belongs_to :conversation
    belongs_to :author, :class_name => "User"

    after_create_commit do
        update_conversation_count(self.conversation_id)
        messages = Conversation.find(self.conversation_id).chat_messages
        ChatMessageCreationEventBroadcastJob.perform_later({chat_messages: ActiveModel::Serializer::CollectionSerializer.new(messages, each_serializer: ChatMessageSerializer)}.to_json, self.conversation_id)
    end

    private

    def update_conversation_count(conversation_id)

        conversation = Conversation.find(conversation_id)
        conversation.update(message_count: (conversation.message_count + 1))

    end
    # subjects: ActiveModel::Serializer::CollectionSerializer.new(owned_subjects, each_serializer: SubjectSerializer)
end
