class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.integer :year, null: false
      t.text :description, null: false
      t.string :director, null: false
      t.string :cast, null: false

      t.timestamps
    end
  end
end
