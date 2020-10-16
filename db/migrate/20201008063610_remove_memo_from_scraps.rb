class RemoveMemoFromScraps < ActiveRecord::Migration[6.0]
  def change
    remove_column :scraps, :memo, :text
  end
end
