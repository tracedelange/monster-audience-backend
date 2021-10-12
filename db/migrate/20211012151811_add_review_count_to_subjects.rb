class AddReviewCountToSubjects < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :review_count, :integer, default: 0
  end
end
