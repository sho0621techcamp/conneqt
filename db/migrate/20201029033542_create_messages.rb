class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :issue_title, null: false
      t.text :issue_text, null: false
      t.references :user,  foreign_key: true
      t.references :tutor, foreign_key: true
      t.timestamps
    end
  end
end
