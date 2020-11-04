class RemoveLangTagFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :users, :lang_tag, null: false, foreign_key: true
  end
end
