class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.text :name
      t.text :catchphrase
      t.text :job
      t.text :items
      t.text :image
      t.integer :user_id
    end
  end
end
