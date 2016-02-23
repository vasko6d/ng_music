class SingersController < ApplicationController

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
		  flash[:notice] = "Invalid Input"
		  redirect_to action: 'new'
	  end
  end

  private
  def singer_params
    params.require(:singer).permit(:name, :dob, :sex)
  end
end