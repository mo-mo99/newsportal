class MakeUrlUnique < ActiveRecord::Migration[7.0]
  def up
    add_index :news, :url, unique: true 
  end

  def down
    remove_index :news, :title
  end
end
