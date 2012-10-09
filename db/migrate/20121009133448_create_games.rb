class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :teamA_id
      t.integer :teamB_id
      t.integer :comp_id
      t.integer :result

      t.timestamps
    end
  end
end
