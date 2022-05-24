class CreateGrannies < ActiveRecord::Migration[6.1]
  def change
    create_table :grannies do |t|
      t.string :name
      t.integer :age
      t.integer :price
      t.string :city
      t.references :user, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
