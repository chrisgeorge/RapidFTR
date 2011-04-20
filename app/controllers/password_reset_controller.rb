class PasswordResetController < ApplicationController
  
  skip_before_filter :check_authentication
    
  def new
  end

  def create
    user = User.find_by_user_name(params[:user_name])
    user.request_password_reset = true
    user.save!
    flash[:notice] = "Thank you. A RapidFTR administrator will contact you shortly."
    redirect_to new_password_reset_path
  end
  
end