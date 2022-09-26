class LoginController < ApplicationController
    def new

    end
  def login
    @user = User.find_by(email: params[:email])
if !!@user
    message ="tai khoan khong ton tai vui long dki"
    redirect_to signup_path, notice: message
    return false
end


  end


end
