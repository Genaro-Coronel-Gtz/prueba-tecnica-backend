class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :work_description
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
