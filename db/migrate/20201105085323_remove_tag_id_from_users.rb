class RemoveTagIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :tag_id, :integer
  end
end
