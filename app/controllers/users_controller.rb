class UsersController < ApplicationController

  before_action :set_user

  def show
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Settings updated'
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :send_digest)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
