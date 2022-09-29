# class SessionController < ApplicationController
#     #login
#     def create
#   user = User.find_by(email: params[:session][:email].downcase)
#   if user && user.authenticate(params[:session][:password])
#     session[:user_id] = user.id
#     flash[:notice] = "Logged in successfully."
#     redirect_to user
#   else
#     flash.now[:alert] = "There was something wrong with your login details."
#     render 'new'
#   end
# end
# #logout
# def destroy
#   session[:user_id] = nil
#   flash[:notice] = "You have been logged out."
#   redirect_to root_path
# end
# end


class SessionController < ApplicationController
 def destroy
    session[:user_id] = nil
    message = "You have been logoout"
    redirect_to root_path , notice: message
 end
def new
end

 def create
user = User.find_by(email: params[:email])
puts user
# if !!user 
#     puts 1
#    message  ="User not exsist please sign up account"
#    return redirect_to signup_path, notice: message
#  end

 if user.present? && user.authenticate(params[:password])
    message ="Login successfully"
    session[:user_id] = user.id
  return redirect_to root_path , alert: message
 else
    flash[:notice] ="invalid email or password"
    return redirect_to signin_path
 end
end
end
