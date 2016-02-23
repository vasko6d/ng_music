class SessionsController < ApplicationController

  before_action :authenticate_user, :only => [:home, :profile, :setting]
  before_action :save_login_state, :only => [:login, :login_attempt]

  def login
  end

  def login_attempt
    authorized_user = User.authenticate(params[:username],params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      redirect_to(:action => 'home')
    else
      flash[:notice] = "Invalid Username or Password"
      render "login"	
    end
    flash.discard
  end

  def logout
  	  session[:user_id] = nil
      redirect_to :action => 'login'
  end

  def home
    if !$query
      $query = params[:search]
    end
    @singer = Singer.search($query)
  	@album = Album.search($query)
    $query = nil
    if request.fullpath != "/home" && !@singer.any? && !@album.any?
      flash.now[:notice] = "Sorry! No results matched that query."
    end
  end
end
