require "koala"
class PagesController < ApplicationController

	def start
		session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, REDIRECT_URI)
		@auth_url =  session[:oauth].url_for_oauth_code(:permissions=>"email") 	
		puts session.to_s + "<<< session"
		
  	 redirect_to @auth_url

	end

def callback
  if params[:code]
  		# acknowledge code and get access token from FB
		  session[:access_token] = session[:oauth].get_access_token(params[:code])
		end		
		 # auth established, now do a graph call:
		@api = Koala::Facebook::API.new(session[:access_token])
		begin
			@graph_data = @api.get_object("me")
		rescue Exception=>ex
			puts ex.message
		end
		
		
		@email = @graph_data['email']
		@id = @graph_data['id']
		@name = @graph_data['name']
		#@user = User.get_by_fb_id(@id)
		#@comp = Comp.first(:order => "id DESC", :conditions => [ "status = ?", 0 ])
		
		if @user.nil?
			@user = User.new
			@user.fb_id = @id
			@user.email = @email
			@user.save
		end
		
 		respond_to do |format|
		 format.html {   }			 
		end
	end
end

