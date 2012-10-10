
class PagesController < ApplicationController
require "koala"
def start
  @oauth= Koala::Facebook::OAuth.new(APP_ID, APP_SECRET,REDIRECT_URI)
  redirect_to @oauth.url_for_oauth_code(:permissions=>"my permissions")
end

def callback
  session[:access_token] = @oauth.get_access_token(params[:code])
  redirect_to(:action=>"my action")
end

def home
  puts("boo")
end