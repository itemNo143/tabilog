class CreateScrapFolders < ActiveRecord::Migration[6.0]
  def change
    create_table :scrap_folders do |t|
      t.string :name, null: false
      t.references :travel, foreign_key: true
      t.timestamps
    end
  end
end
