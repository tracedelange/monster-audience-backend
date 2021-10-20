class ChatMessageCreationEventBroadcastJob < ApplicationJob

  queue_as :default
    
    def perform(chat_message)

        # ChatChannel.broadcast_to('chat_message:1', chat_message)

      ActionCable.server.broadcast('chat_channel', chat_message)

    end
end