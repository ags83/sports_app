require "koala"
class PagesController < ApplicationController

	def start
		puts "IIIIIIIIIIIIIIIIIIIIIIIINNNNNNNNNNNNNNNNNNNNNNNNNNN HHHHHHHHHHHHHHHHHHEEEEEEEEEEEEEEEEEEEERRRRRRRRRRRRRRRRRRRREEEEEEEEEEEEEEEE "

  @oauth= Koala::Facebook::OAuth.new(APP_ID, APP_SECRET,REDIRECT_URI)
  redirect_to @oauth.url_for_oauth_code()
end

def callback
  @sess = @oauth.get_access_token(params[:code])
  puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOEEEEEEEEEEE "
  respond_to do |format|
		 format.html {   }			 
		end
end
		 
	'''  
	end

	def callback
	  if params[:code]
  		# acknowledge code and get access token from FB
		  session[:access_token] = session[:oauth].get_access_token(params[:code])
		end		

		 # auth established, now do a graph call:

		@api = Koala::Facebook::API.new(session[:access_token])
		begin
			@graph_data = @api.get_object("my.Name")
		rescue Exception=>ex
			puts ex.message
		end
 		respond_to do |format|
		 format.html {   }			 
		end
	end

	def home
	  puts("boo")
	end
	
	'''
end