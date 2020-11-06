class CreateGlams < ActiveRecord::Migration[6.0]
  def change
    create_table :glams do |t|
      t.string :glam_squad
      t.string :makeup
      t.string :hair
      t.string :wardrobe
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
