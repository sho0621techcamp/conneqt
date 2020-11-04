class RemoveTagIdFromLangTags < ActiveRecord::Migration[6.0]
  def change
    remove_column :lang_tags, :tag_id, :integer
  end
end
