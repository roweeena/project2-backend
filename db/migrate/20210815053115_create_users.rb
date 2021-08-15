class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :email
      t.text :name
      t.boolean :admin, :default => false
      t.string :password_digest
    end
  end
end
