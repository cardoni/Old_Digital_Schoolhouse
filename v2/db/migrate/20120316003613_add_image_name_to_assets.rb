class AddImageNameToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :image_name, :string

  end
end
