class ChatChannel < ApplicationCable::Channel
    def subscribed
      stream_from "chat_channel_#{params[:id]}"
    end
  
    def unsubscribed
      puts 'unsubscribing'
    end
  
    def create(opts)
      ChatMessage.create(
        conversation_id: params[:id],
        content: opts.fetch('content')
      )
    end
  end