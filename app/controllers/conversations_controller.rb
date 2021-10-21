class ConversationsController < ApplicationController

    before_action :set_current_user

    def index
        conversations = Conversation.where(user_id: @user.id).or(Conversation.where(recipient_id: @user.id))
        render json: conversations
    end

    def show #return all messages associated with a conversation. After, adjust so tht only the most recent relevant messages are loaded.
        conversation = Conversation.find(params[:id])
        if conversation.user_id == @user.id || conversation.recipient_id == @user.id
            messages = conversation.chat_messages
            render json: messages
        else
            render json: {error: "You don't have permission to view this chat."}, status: :unprocessable_entity
        end
    end

    def create
    end

    def destroy
    end

end
