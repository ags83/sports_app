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
		puts << "THHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH"
		#@email = @graph_data['email']
		#@id = @graph_data['id']
		@name = @graph_data['name']
		
 		respond_to do |format|
		 format.html {   }			 
		end

	end
end

'''
Hi Anna,

Thanks for your email.

I will be back on the 15th.  If you wish I can give you a call then.  I don't have much in the way of salary expectations at the moment, I am much more interested in getting into the right area and being able to improve my skills on a full time basis.  I am sure I would find the amount offered to be acceptable.

My CV has most of my details, I just like to make it clear so as not to waste each others time that my background is likely fairly different from most candidates.  I am not a recent graduate with top marks and I am not certain I could currently answer many difficult 'algorithmic' type interview questions very well.  Lately I've been working on developing more 'real' world programming skills such as working with different Technologies and API's.  Though I do feel that I certainly make up for it with passion and would most definitely work harder than anyone else they would hire.

Regards,
Aaron.


'''
