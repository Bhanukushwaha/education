class AddImageToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :image, :string
    add_column :users, :state, :string
    add_column :users, :city, :string
    add_column :users, :student_id, :string
    add_column :users, :phone, :string
    add_column :users, :country, :string
    add_column :users, :Date_of_birth, :datetime
    add_column :users, :status, :string, default: "pandding"
    add_column :users, :latitude, :decimal, {:precision=>10, :scale=>6}
		add_column :users, :longitude, :decimal, {:precision=>10, :scale=>6}
  end
end
