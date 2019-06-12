class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :body
      t.integer :poll_id
      t.timestamp
    end
  end
end
