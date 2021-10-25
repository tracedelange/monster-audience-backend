class AddMessageCountToConversations < ActiveRecord::Migration[6.1]
  def change
    add_column :conversations, :message_count, :integer, default: 0
  end
end
