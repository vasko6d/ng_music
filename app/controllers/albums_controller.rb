class AlbumsController < ApplicationController
  before_action :authenticate_user, :only => [:new, :create]
  before_action :disable_search_bar, :only => [:new, :create]

  def new
  	@album = Album.new
  end

  def create
  	#render plain: album_params.inspect
  	singer_name = album_params[:singer_attributes][:name]
  	find_singer = Singer.where("name = ?",singer_name)
  	if find_singer.any?
	  	singer_id = find_singer.take.ng_singers_id
	  	@album = Album.new(:ng_singers_id => singer_id)
	  	if @album.update_attributes(:album_name => album_params[:album_name], :release_year => album_params[:release_year],:record_company => album_params[:record_company])
           $query = @album.album_name
	  	   flash[:success] = "Your new album was added succesfully. Showing search results for a query of '#{$query}'"
		   redirect_to controller: 'sessions', action: 'home'
		else
		   @album.singer = Singer.new(:name => singer_name)
		   render 'new'
		end
	else
		@album = Album.new(:album_name => album_params[:album_name], :release_year => album_params[:release_year],:record_company => album_params[:record_company])
		flash.now[:error] = "Specified singer, #{singer_name} not in database. Please add the singer seperately before their albums"
		render 'new'
	end
  end

  private
  def album_params
  	params.require(:album).permit(:album_name,:ng_singers_id, :release_year, :record_company, singer_attributes: [:name])
  end

end