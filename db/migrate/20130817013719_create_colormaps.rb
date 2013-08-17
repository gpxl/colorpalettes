class CreateColormaps < ActiveRecord::Migration
  def change
    create_table :colormaps do |t|
      t.string :uri
      t.text :treemap
      t.integer :color_count
      t.integer :reference_count
      t.timestamps
    end
  end
end
