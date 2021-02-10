class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :family_name
      t.string :first_name
      t.string :username
      t.string :email
      t.string :image
      t.text :profile
      t.string :password_digest
      t.timestamps
    end
  end
end
