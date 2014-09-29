class DigestController < ApplicationController

  def unsubscribe
    @user = User.find_by_access_token(params[:signature])
    if @user && @user.unsubscribe_digest!
      render 'users/digest/unsubscribe_success'
    else
      render 'users/digest/unsubscribe_error'
    end
  end

end
