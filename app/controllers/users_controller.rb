class UsersController < ApplicationController

  before_action :save_login_state, :only => [:new, :create]

  def new
  end
end
