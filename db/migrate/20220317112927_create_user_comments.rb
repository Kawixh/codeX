class CreateUserComments < ActiveRecord::Migration[7.0]
  def change
    create_table :user_comments do |t|
      t.references :user_blog, null: false, foreign_key: true, on_delete: :cascade
      t.references :comment, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
