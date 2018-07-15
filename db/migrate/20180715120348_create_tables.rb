class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :tables do |t|
      t.string :name
      t.integer :min_guests
      t.integer :max_guests
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
