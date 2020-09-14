class CreatePenpals < ActiveRecord::Migration[6.0]
  def change
    create_table :penpals do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :frequency
      t.timestamps
    end
  end
end
