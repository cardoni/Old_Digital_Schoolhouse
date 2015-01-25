class Changecolumntype < ActiveRecord::Migration
  def up
    change_table :attachments do |t|
      t.change :provider, :string
    end
  end

  def down
    change_table :attachments do |t|
      t.change :provider, :integer
    end
  end
end