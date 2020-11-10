class CreateTutors < ActiveRecord::Migration[6.0]
  def change
    create_table :tutors do |t|
      t.string :tutor_name,      null: false
      t.string :email,           null: false
      t.string :password_digest, null: false
      t.text   :tutor_introduction
      t.text   :github_account
      t.timestamps
    end
  end
end
