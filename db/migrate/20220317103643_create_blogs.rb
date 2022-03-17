class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.references :user, null: false, foreign_key: true, on_delete: :cascade
      t.string :name
      t.string :header
      t.string :title
      t.string :headline
      t.string :subtext
      t.string :sub_headline
      t.string :body
      t.string :paragraph1
      t.string :code1
      t.string :paragraph2
      t.string :code2
      t.string :paragraph3
      t.string :code3
      t.string :paragraph4
      t.string :code4

      t.timestamps
    end
  end
end
