class AddUserToLinks < ActiveRecord::Migration[6.1]
  def change
    add_reference :links, :user, null: false, foreign_key: true
  end
end
