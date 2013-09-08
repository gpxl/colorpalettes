class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :color_count
      t.integer :reference_count
      t.integer :colormap_id
      t.timestamps
    end
  end
end
