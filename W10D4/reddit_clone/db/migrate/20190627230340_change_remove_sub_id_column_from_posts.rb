class ChangeRemoveSubIdColumnFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :sub_id, :integer
  end
end