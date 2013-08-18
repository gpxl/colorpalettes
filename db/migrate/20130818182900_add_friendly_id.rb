class AddFriendlyId < ActiveRecord::Migration
  def change
    add_column :colormaps, :slug, :string
    add_index :colormaps, :slug, unique: true
  end
end
