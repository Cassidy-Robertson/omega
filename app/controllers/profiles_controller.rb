class ProfilesController < ApplicationController
 before_filter :authenticate_user!, except: [:index, :show]
  def show
    @user = User.find(params[:id])
  end


end
