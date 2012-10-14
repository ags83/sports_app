class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.integer :game_id
      t.integer :user_id
      t.integer :comp_id
      t.integer :team_id

      t.timestamps
    end
  end
end
