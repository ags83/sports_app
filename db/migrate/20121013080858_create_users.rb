class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :fb_id
      t.string :email
      t.integer :score
      t.integer :comp_id

      t.timestamps
    end
  end
end
