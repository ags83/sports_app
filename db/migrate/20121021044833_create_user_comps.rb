class CreateUserComps < ActiveRecord::Migration
  def change
    create_table :user_comps do |t|
      t.integer :user_id
      t.integer :comp_id
      t.integer :score

      t.timestamps
    end
  end
end
