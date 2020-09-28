class CreateScraps < ActiveRecord::Migration[6.0]
  def change
    create_table :scraps do |t|
      t.string :image, null: false
      t.text :memo
      t.references :scrap_folder, foreign_key: true
      t.references :user,         foreign_key: true
      t.timestamps
    end
  end
end
