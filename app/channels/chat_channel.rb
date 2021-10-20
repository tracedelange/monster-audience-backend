class ChatChannel < ApplicationCable::Channel
    def subscribed
      stream_from 'ChatChannel'
    end
  
    def unsubscribed
      puts 'unsubscribing'
    end
  
    def create(opts)
      ChatMessage.create(
        content: opts.fetch('content')
      )
    end
  end