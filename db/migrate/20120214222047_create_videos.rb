class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :description
      t.string :copyright
      t.string :location
      t.string :provider

      t.timestamps
    end
  end
end
