class ConversationsController < ApplicationController

    before_action :set_current_user

    def index
        conversations = Conversation.where(user_id: @user.id).or(Conversation.where(recipient_id: @user.id)).order(updated_at: :desc)
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
        conversations = Conversation.where(user_id: params[:recipient_id]).or(Conversation.where(recipient_id: params[:recipient_id]))
        if conversations.length == 0
            new_convo = @user.conversations.create(conversation_params)
            if new_convo.valid? 
                render json: new_convo
            else
                render json: {errors: new_convo.errors}, status: :unprocessable_entity
            end
        else
            render json: conversations.first
        end
    end

    def destroy
    end

    private

    def conversation_params
        params.permit(:recipient_id)
    end

end
