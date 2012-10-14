class Comp < ActiveRecord::Base
   # for status : 0 = open  1 = close    2 = conmolete
   attr_accessible :status, :close_time
   has_many   :games
   has_many   :tips
   has_many	  :users
end
