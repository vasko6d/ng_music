class AlbumsController < ApplicationController
  before_action :authenticate_user, :only => [:new, :create]
  before_action :disable_search_bar, :only => [:new, :create]

  def new
  	@album = Album.new
  end

  def create
  	render plain: album_params.inspect
  	#@album = Album.new(album_params)
	#  params = nil

  	#if @album.save
    #  $query = @album.name
  #		flash[:success] = "Your new album was added succesfully. Showing search results for a query of '#{$query}'"
	#	  redirect_to controller: 'sessions', action: 'home'
	#  else
#		  flash[:notice] = "Invalid Input"
#		  redirect_to action: 'new'
#	  end
  end

  private
  def album_params
  	params.require(:album).permit(:album_name,:ng_singers_id, :release_year, :record_company, singer_attributes: [:name])
  	#find_singer = Singer.where("name = ?",params[:album].singer_name)
  	#if find_singer.any?
	#  	singer_id = find_singer.take.ng_singers_id
	#  	@album = Album.new(params[:album].merge(:ng_singers_id => singer_id))
	#    params.require(:album).permit(:album_name,:ng_singers_id, :release_year, :record_company)
	#else
#		flash[:notice] = "Referenced singer #{params[:album].singer_name}, does not exist in the database."
#		               + " Please add singer before adding their album"
#		redirect_to action: 'new'
#	end
  end

end