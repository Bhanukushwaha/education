class AddSlugToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :slug, :string
    add_index :articles, :slug
  end
end
