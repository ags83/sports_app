class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :teamA
      t.integer :teamB
      t.string :name

      t.timestamps
    end
  end
end
