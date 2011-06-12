class AlbumsController < ApplicationController
  # GET /albums
  # GET /albums.xml
  def index
    @albums = current_user.albums
    @album = current_user.albums.first
    @pictures = @album.pictures
    
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @albums }
    end
  end
  
  def import_facebook_photos
    
    @graph = current_user.facebook_graph

    @albums = @graph.get_connections("me", "albums")

    @albums.each do |a|
      album = current_user.albums.build(:uid => a["id"], :cover_photo_id => a["cover_photo"])
      album.save
      @pictures = @graph.get_connections(a["id"], "photos")
      @pictures.each do |p|
        picture = album.pictures.build(:uid => p["id"], :thumb_url => p["picture"], :source_url => p["source"])
        picture.save
      end
    end
    
    redirect_to albums_path

  end

  # GET /albums/1
  # GET /albums/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @album }
    end
  end

  # GET /albums/new
  # GET /albums/new.xml
  def new
    @album = Album.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @album }
    end
  end

  # GET /albums/1/edit
  def edit
    @album = Album.find(params[:id])
  end

  # POST /albums
  # POST /albums.xml
  def create
    @album = Album.new(params[:album])

    respond_to do |format|
      if @album.save
        format.html { redirect_to(@album, :notice => 'Album was successfully created.') }
        format.xml  { render :xml => @album, :status => :created, :location => @album }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /albums/1
  # PUT /albums/1.xml
  def update
    @album = Album.find(params[:id])

    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to(@album, :notice => 'Album was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.xml
  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to(albums_url) }
      format.xml  { head :ok }
    end
  end
end
