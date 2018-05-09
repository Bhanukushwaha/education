class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone
      t.string :city
      t.string :country
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end
