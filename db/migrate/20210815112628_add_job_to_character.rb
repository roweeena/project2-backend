class AddJobToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :job, :text

    remove_column :characters, :class, :text
  end
end
