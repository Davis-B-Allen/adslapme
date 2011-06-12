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
    @albums = @graph.get_connections("me", "albums")
    @albums.each do |a|
      if a["name"] == "Profile Pictures"
        @pictures = @graph.get_connections(a["id"], "photos")
        @temp_pic_url = @pictures[0]["source"]
        # @temp_pic_url = @pictures[rand(@pictures.size)]["source"]
        puts "#{@temp_pic_url}"
      end
    end
    
    profile = @graph.get_object("me")
    uid = profile['id']

    user = User.find_by_uid(uid)

    if user
      session[:uid] = uid
      session[:user_id] = user.id
      user.facebook_token = facebook_token
      user.temp_pic_url = @temp_pic_url if @temp_pic_url
      user.save
      redirect_to user_path(user)
    else
      user = User.new(:uid => profile['id'], :first_name => profile['first_name'], :last_name => profile['last_name'], :name => profile['name'])
      user.facebook_token = facebook_token
      user.temp_pic_url = @temp_pic_url if @temp_pic_url
      user.save
      session[:uid] = uid
      session[:user_id] = user.id
      redirect_to user_path(user)
    end
  end

end
