class SingersController < ApplicationController
  before_action :authenticate_user, :only => [:new, :create]
  before_action :disable_search_bar, :only => [:new, :create]

  def new
  	@singer = Singer.new
  end

  def create
  	#render plain: singer_params.inspect
  	@singer = Singer.new(singer_params)
	  params = nil

  	if @singer.save
      $query = @singer.name
  		flash[:success] = "Your new singer was added succesfully. Showing search results for a query of '#{$query}'"
		  redirect_to controller: 'sessions', action: 'home'
	  else
		  render'new'
	  end
  end

  private
  def singer_params
    params.require(:singer).permit(:name, :dob, :sex)
  end
end