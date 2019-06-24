class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.string :body
      t.boolean :completed,  null: false
      t.boolean :private,  null: false
      t.timestamps
    end
  end
end
