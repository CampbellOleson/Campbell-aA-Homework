class CreateCommentsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id, null: false
      t.integer :goal_id, null: false
      t.timestamps
    end
  end
end
