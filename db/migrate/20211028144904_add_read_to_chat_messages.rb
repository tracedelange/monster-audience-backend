class AddReadToChatMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :chat_messages, :read, :boolean, default: false
  end
end
