class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value, null: false
      t.integer :review_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_column :reviews, :vote_count, :integer, null: false, default: 0
  end
end
