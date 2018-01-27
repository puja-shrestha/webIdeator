class CreateIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :ideas do |t|
      t.integer :user_id
      t.text :description
      t.string :author
      t.timestamps null: false
    end

    add_index :ideas, :user_id
  end
end
