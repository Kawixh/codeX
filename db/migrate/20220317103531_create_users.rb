class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :password_digest
      t.string :password_secure
      t.string :password_confirmation
      t.string :full_name
      t.string :phone_number
      t.string :email
      t.string :country

      t.timestamps
    end
  end
end
