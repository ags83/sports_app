require "koala"
class PagesController < ApplicationController
def start
  @oauth= Koala::Facebook::OAuth.new(APP_ID, APP_SECRET,REDIRECT_URI)
  redirect_to @oauth.url_for_oauth_code(:permissions=>"my permissions")
end

def callback
  session[:access_token] = @oauth.get_access_token(params[:code])
  redirect_to(:action=>"my action")
end

def home
  @api = Koala::Facebook::API.new(session[:access_token])
  begin
    @graph_data = @api.get_object("/me/photos")
  rescue Exception=>ex
    puts ex.message
  end

  @graph_data do |photo|
    puts "my photo: #{photo.name}" 
  end
end
