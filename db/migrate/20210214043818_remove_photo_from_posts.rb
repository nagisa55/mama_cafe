class RemovePhotoFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :photo, :string
  end
end
