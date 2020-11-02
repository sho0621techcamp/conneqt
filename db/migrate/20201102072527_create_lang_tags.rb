class CreateLangTags < ActiveRecord::Migration[6.0]
  def change
    create_table :lang_tags do |t|
      t.integer    :tag,  null: false
      t.integer    :star, null: false
      t.references :user,             foreign_key: true
      t.references :tutor,            foreign_key: true
      t.references :messages,         foreign_key:true
      t.timestamps
    end
  end
end
