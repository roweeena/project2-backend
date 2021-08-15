class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.text :email
      t.text :class
      t.text :catchphrase
      t.text :image
    end
  end
end
