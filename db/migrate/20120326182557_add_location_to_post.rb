class AddLocationToPost < ActiveRecord::Migration
  def change
    add_column :posts, :location, :string

  end
end
