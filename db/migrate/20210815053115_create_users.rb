class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :email
      t.text :username
      t.boolean :admin, :default => false
      t.string :password_digest

      t.timestamps
    end
  end
end
