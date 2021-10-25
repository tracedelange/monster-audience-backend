class ChatChannel < ApplicationCable::Channel
    def subscribed
      stream_from "chat_channel_#{params[:id]}"
    end
  
    def unsubscribed
      puts 'unsubscribing'
    end
  
    def create(opts)

      newMessage = ChatMessage.create(
        author_id: params[:user_id],
        conversation_id: params[:id],
        content: opts.fetch('content')
      )

    end
  end