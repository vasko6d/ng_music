class UsersController < ApplicationController

  before_action :save_login_state, :only => [:new, :create]

  def index
  	@user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end
end
