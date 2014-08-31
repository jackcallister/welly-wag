class NotificationsController < ApplicationController
  before_filter :authenticate_user!

  def destroy
    current_user.notifications.delete_all
    redirect_to :back
  end
end
