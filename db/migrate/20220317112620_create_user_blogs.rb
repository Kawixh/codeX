class CreateUserBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :user_blogs do |t|
      t.references :user, null: false, foreign_key: true, on_delete: :cascade
      t.references :blog, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
