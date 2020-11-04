class RemoveTagFromLangTags < ActiveRecord::Migration[6.0]
  def change
    remove_column :lang_tags, :tag, :integer
  end
end
