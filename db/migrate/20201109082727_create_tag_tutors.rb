class CreateTagTutors < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_tutors do |t|
      t.references :tutor, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
    end
  end
end
