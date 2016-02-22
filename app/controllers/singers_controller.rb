class SingersController < ApplicationController
  def index
  	@singer = Singer.all
  end

  def show
    @singer = Singer.find(params[:id])
  end
end
