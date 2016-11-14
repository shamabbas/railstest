class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :owner_id
      t.string :name, limit: 100
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.timestamps null: false
    end
  end
end
