class AddLogoToTeam < ActiveRecord::Migration
  def self.up
    add_attachment :teams, :photo
  end

  def self.down
    remove_attachment :teams, :photo
  end
end
