class AddStateToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :state, :string, null: false, default: "draft"
  end
end
