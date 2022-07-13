class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.string :title, index: true
      t.string :author
      t.text :description
      t.string :url
      t.string :image
      t.string :category
      t.date :published_at

      t.timestamps
    end
  end
end
