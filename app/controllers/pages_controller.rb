require "koala"
class PagesController < ApplicationController

	def start
		session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, REDIRECT_URI)
		@auth_url =  session[:oauth].url_for_oauth_code(:permissions=>"email") 	
		puts session.to_s + "<<< session"
		
  	 redirect_to session[:oauth].url_for_oauth_code()

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
 		respond_to do |format|
		 format.html {   }			 
		end

	end
end
