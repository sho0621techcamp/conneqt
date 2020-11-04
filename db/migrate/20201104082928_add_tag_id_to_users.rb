class AddTagIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :tag_id, :integer
  end
end
