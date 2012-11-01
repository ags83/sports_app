class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :fb_id
      t.string :email
      t.string :password_digest
      t.integer :comp_id
      t.integer :score

      t.timestamps
    end
  end
end
