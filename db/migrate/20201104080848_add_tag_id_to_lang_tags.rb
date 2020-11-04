class AddTagIdToLangTags < ActiveRecord::Migration[6.0]
  def change
    add_column :lang_tags, :tag_id, :integer
  end
end
