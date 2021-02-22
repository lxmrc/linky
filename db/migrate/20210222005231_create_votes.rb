class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.references :link, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.integer :direction, null: false

      t.timestamps
    end
  end
end
