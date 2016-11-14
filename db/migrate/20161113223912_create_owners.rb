class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :name, limit: 50
      t.timestamps null: false
    end
  end
end
