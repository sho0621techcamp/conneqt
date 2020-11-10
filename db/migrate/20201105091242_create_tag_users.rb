class CreateTagUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_users, id: false do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
