class AddNewAttributeToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :useradmin_id, :integer
  end
end
