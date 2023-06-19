class RemoveUseradminIdFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :su
  end
end