require "koala"
class PagesController < ApplicationController

	def start
	  @oauth= Koala::Facebook::OAuth.new(APP_ID, APP_SECRET,REDIRECT_URI)
	  redirect_to @oauth.url_for_oauth_code()
	end

	def callback
	  session[:access_token] = @oauth.get_access_token(params[:code])
	  redirect_to()
	end

	def home
	  puts("boo")
	end
end