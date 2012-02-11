class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.boolean :active_author
      t.integer :school_id
      t.text :bio

      t.timestamps
    end
  end
end
