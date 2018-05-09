class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.string :likeable_type
      t.string :likeable_id

      t.timestamps
    end
  end
end
