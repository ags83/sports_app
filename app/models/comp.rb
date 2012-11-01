class Comp < ActiveRecord::Base
   # for status : 0 = open  1 = close    2 = complete
   attr_accessible :status, :close_time, :games_attributes
   has_many   :games
   has_many   :tips
   has_many	  :users
   has_many   :usercomps
   
   accepts_nested_attributes_for :games
end

