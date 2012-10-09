class CreateComps < ActiveRecord::Migration
  def change
    create_table :comps do |t|
      t.integer :status
      t.datetime :closetime

      t.timestamps
    end
  end
end
