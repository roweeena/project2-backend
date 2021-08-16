class AddColumnsCharUser < ActiveRecord::Migration[5.2]
  def change

    add_column :characters, :user_id, :integer
    add_column :items, :character_id, :integer

    remove_column :items, :email

  end
end
