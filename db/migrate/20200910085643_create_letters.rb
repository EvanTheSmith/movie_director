class CreateLetters < ActiveRecord::Migration[6.0]
  def change
    create_table :letters do |t|
      t.string :message
      t.integer :user_id
      t.integer :penpal_id
      t.timestamps
    end
  end
end