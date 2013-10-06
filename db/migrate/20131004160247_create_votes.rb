class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value, null: false
      t.integer :voteable_id, null: false
      t.string :voteable_type, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    
    add_index :votes, [:voteable_id, :voteable_type]
    add_column :reviews, :vote_count, :integer, null: false, default: 0
  end
end
