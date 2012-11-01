class User < ActiveRecord::Base
   attr_accessible :fb_id, :email, :comp_id, :score, :password, :password_confirmation
   has_secure_password
   has_many     :tips
   has_many		:usercomps
   belongs_to   :comp
   validates_presence_of :password, :on => :create
end
