class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :genre
      t.integer :release_year
      t.integer :director_id
      t.integer :actor_id
      t.timestamps
    end
  end
end
