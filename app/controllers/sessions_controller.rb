class SessionsController < ApplicationController

  def new
    @oauth = Koala::Facebook::OAuth.new(Settings.facebook.app_id, Settings.facebook.app_secret, "#{Settings.app_url}/sessions/facebook_session_create")
    facebook_login_url = @oauth.url_for_oauth_code(:permissions => "publish_stream,user_photos")
    redirect_to facebook_login_url
  end

  def create

  end

  def facebook_session_create
    code = params[:code]
    @oauth = Koala::Facebook::OAuth.new(Settings.facebook.app_id, Settings.facebook.app_secret, "#{Settings.app_url}/sessions/facebook_session_create")
    facebook_token = @oauth.get_access_token(code)
    @graph = Koala::Facebook::GraphAPI.new(facebook_token)
    profile = @graph.get_object("me")
    uid = profile['id']
    debugger

    puts "#{uid}"

    user = User.find_by_uid(uid)

    if user
      session[:uid] = uid
      redirect_to user_path(user)
    else
      @user = User.create(:uid => profile['id'], :first_name => profile['first_name'], :last_name => profile['last_name'], :name => profile['name'])
      session[:uid] = uid
      redirect_to root_path
    end
  end

end
