class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :user_blog, null: false, foreign_key: true, on_delete: :cascade
      t.string :text
      t.boolean :is_liked

      t.timestamps
    end
  end
end
