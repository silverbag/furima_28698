class ItemsController < ApplicationController
  # before_action :move_to_index

  def index
  end

  def new
    @users = User.new 
  end

  def create
   @users = User.new(user_param)
    if @users.save
     redirect_to root_path
    else
     render.new
    end
  end

  def show
  end

  # def move_to_index
  #   unless user_signed_in?
  #    redirect_to action: :index
  #   end
end
