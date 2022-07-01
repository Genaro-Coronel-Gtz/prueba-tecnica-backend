class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.string :action
      t.string :ip
      t.string :navigator
      t.string :person_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
