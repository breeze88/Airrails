class UserController < ApplicationController
  def show
    @user = User.friendly.find(params[:slug])
  end
end
