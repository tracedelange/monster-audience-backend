class AddAvatarLinkToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :avatar_link, :string
  end
end
