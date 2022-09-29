class PasswordController < ApplicationController
before_action :require_logged_in
 def edit
 end

 def update
if Current.user.update(password_params)
redirect_to root_path , alert: "update password success"
else
    render :edit
 end
end

 private
 def password_params
    params.permit(:password)
 end
end