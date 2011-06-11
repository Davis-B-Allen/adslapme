class SessionsController < ApplicationController

  def new
    @oauth = Koala::Facebook::OAuth.new(Settings.facebook.app_id, Settings.facebook.app_secret, "#{Settings.app_url}/sessions/facebook_session_create")
    facebook_login_url = @oauth.url_for_oauth_code
    redirect_to facebook_login_url
  end
  
  def create
    
  end

  def facebook_session_create
    code = params[:code]
    @oauth = Koala::Facebook::OAuth.new(Settings.facebook.app_id, Settings.facebook.app_secret, "#{Settings.app_url}/sessions/facebook_session_create")
    facebook_token = @oauth.get_access_token(code)
    graph = Koala::Facebook::GraphAPI.new(facebook_token)
    puts "#{facebook_token}"
    
    redirect_to root_path
  end

end
