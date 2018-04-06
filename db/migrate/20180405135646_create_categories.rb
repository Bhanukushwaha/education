class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.boolean :is_active

      t.timestamps
    end
  end
end
