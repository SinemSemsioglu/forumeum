class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if params[:search]
       @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.all.order('created_at DESC')
    end
  end
  
  def show
  
  end
end
