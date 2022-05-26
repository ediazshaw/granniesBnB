class CreateGrannyAbilities < ActiveRecord::Migration[6.1]
  def change
    create_table :granny_abilities do |t|
      t.references :granny, null: false, foreign_key: true
      t.references :ability, null: false, foreign_key: true

      t.timestamps
    end
  end
end
