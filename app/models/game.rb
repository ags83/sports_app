class Game < ActiveRecord::Base
   attr_accessible :result, :teamA, :teamB, :teamA_id, :teamB_id, :comp_id, :comp
   validates_presence_of :teamA_id, :teamB_id
   has_many    :tips
   belongs_to   :teamA, :class_name => 'Team'#, :foreign_key => 'teamA'
   belongs_to   :teamB, :class_name => 'Team'#, :foreign_key => 'teamB'
   belongs_to   :comp
   
end
