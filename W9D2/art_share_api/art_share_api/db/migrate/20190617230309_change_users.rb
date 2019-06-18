class ChangeUsers < ActiveRecord::Migration[5.2]
  def change

    add_column :users, :username, :string
    remove_column :users, :email
    remove_column :users, :name
  end
end
