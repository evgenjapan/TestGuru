class AddNameToFeedbacks < ActiveRecord::Migration[5.2]
  def change
    add_column :feedbacks, :name, :string, null: false, default: 'Anonymous'
  end
end
