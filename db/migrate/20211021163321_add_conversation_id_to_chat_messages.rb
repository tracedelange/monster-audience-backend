class AddConversationIdToChatMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :chat_messages, :conversation_id, :integer
  end
end
