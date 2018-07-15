class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.integer :restaurant_id
      t.string :name
      t.time :from
      t.time :to

      t.timestamps
    end
  end
end
