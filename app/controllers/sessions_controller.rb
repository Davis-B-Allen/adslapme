class SessionsController < ApplicationController

  def new
    @oauth = Koala::Facebook::OAuth.new(103530109716629, "8e9f233a2b27f508ae24ca0b58c2db2a", "http://3pcq.localtunnel.com/sessions/facebook_session_create")
    facebook_login_url = @oauth.url_for_oauth_code
    redirect_to facebook_login_url
  end
  
  def create
    
  end

  def facebook_session_create
    code = params[:code]
    @oauth = Koala::Facebook::OAuth.new(103530109716629, "8e9f233a2b27f508ae24ca0b58c2db2a", "http://3pcq.localtunnel.com/sessions/facebook_session_create")
    facebook_token = @oauth.get_access_token(code)
    graph = Koala::Facebook::GraphAPI.new(facebook_token)
    puts "#{facebook_token}"
    
    redirect_to root_path
  end

end
