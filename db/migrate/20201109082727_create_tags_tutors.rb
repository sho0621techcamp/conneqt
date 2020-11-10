class CreateTagsTutors < ActiveRecord::Migration[6.0]
  def change
    create_table :tags_tutors do |t|
      t.references :tutor, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
    end
  end
end
