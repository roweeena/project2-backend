class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|t.text :email
    t.text :image
    t.integer :character_id
    end
  end
end
