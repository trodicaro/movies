class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :backdrop_path
      t.text :overview
      t.decimal :popularity

      t.timestamps
    end
  end
end
