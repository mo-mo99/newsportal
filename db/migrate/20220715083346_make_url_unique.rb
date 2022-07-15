class MakeUrlUnique < ActiveRecord::Migration[7.0]
  def change
    remove_index :news, :title
    add_index :news, :url, unique: true 
  end
end
