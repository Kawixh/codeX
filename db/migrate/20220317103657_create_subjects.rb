class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.references :book, null: false, foreign_key: true
      t.string :subject

      t.timestamps
    end
  end
end
