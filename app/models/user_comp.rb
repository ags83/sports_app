class UserComp < ActiveRecord::Base
   attr_accessible :comp_id, :comp, :user_id, :user, :score
   belongs_to   :user
   belongs_to   :comp
end
