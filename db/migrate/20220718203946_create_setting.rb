class CreateSetting < ActiveRecord::Migration[7.0]
  def change
    create_table :settings do |t|
      t.text :api, array: true, default: []
      t.text :tags, array: true, default: []
      t.references :user, null: false, foreign_key: true, unique: true

      t.timestamps
    end
  end
end
