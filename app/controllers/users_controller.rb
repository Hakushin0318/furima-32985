class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @name = @user.name
  end

  def edit
  end
end
