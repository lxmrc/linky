class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :destination, null: false
      t.text :description
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
