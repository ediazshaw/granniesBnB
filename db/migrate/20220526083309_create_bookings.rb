class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :granny, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :initial_date
      t.date :final_date
      t.integer :num_grandsons
      t.string :status

      t.timestamps
    end
  end
end
