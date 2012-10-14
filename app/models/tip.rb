class Tip < ActiveRecord::Base
attr_accessible :user_id, :user, :team_id, :team, :game_id, :game, :comp, :comp_id
belongs_to   :game
belongs_to   :comp
belongs_to   :team
belongs_to   :user
end
