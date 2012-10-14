class User < ActiveRecord::Base
   attr_accessible :fb_id, :email, :comp_id, :score
   has_many     :tips
   belongs_to   :comp
end
