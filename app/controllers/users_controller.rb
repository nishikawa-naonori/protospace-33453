class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    #@prototype = Prototype.new
    #@prototype = Prototype.find(params[:id])
  end

end
