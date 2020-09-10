class CreatePenpalTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :penpal_topics do |t|
      t.integer :topic_id
      t.integer :penpal_id
      t.timestamps
    end
  end
end
