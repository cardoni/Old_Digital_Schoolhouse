class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title
      t.string :description
      t.string :copyright
      t.string :location
      t.string :provider

      t.timestamps
    end
  end
end
