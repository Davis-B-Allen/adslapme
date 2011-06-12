class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
  def submit_pic
    @user = User.find(session[:user_id])
    @graph = current_user.facebook_graph
    @graph.put_wall_post("#{params[:msg]}: #{params[:url]}     created your own at: www.adslapit.com")
    @user.feather_link = params[:url]
    @user.save
    redirect_to root_path
  end
  
  def show_sw_pics
    @pics = User.all.map(&:feather_link)
  end

  # GET /users/1
  # GET /users/1.xml
  def show

    @user = User.find(params[:id])
    if session[:user_id] != @user.id
      flash[:notice] = "Please log in"
      redirect_to root_path
    end
    # @graph = Koala::Facebook::GraphAPI.new(@user.facebook_token)
    # 
    # @albums = @graph.get_connections("me", "albums")
    # 
    # @pic_url_array = []
    # @albums.each do |a|
    #   photos = @graph.get_connections(a['id'], "photos")
    #   photos.each do |p| 
    #     @pic_url_array << p['picture']
    #   end
    # end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
