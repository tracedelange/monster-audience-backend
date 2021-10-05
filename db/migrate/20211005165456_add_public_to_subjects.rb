class AddPublicToSubjects < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :public, :boolean, default: true
  end
end
