class CreatePenpalInterests < ActiveRecord::Migration[6.0]
  def change
    create_table :penpal_interests do |t|
      t.integer :interest_id
      t.integer :penpal_id
      t.timestamps
    end
  end
end
