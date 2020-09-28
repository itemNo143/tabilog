class CreateTravels < ActiveRecord::Migration[6.0]
  def change
    create_table :travels do |t|
      t.string :name,        null: false
      t.string :start_date,  null: false
      t.string :end_date,    null: false
      t.string :image
      t.text :memo
      t.timestamps
    end
  end
end
