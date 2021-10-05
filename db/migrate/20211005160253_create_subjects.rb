class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :name
      t.integer :user_id
      t.string :description
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
