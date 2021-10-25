class AddAuthorIdToChatMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :chat_messages, :author_id, :integer
  end
end
