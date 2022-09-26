class RegisterController < ApplicationController
    def new
        # use instance variable to view can access
       @user =User.new
    end
    def create
@user = User.find_by(email: params[:email])
puts @user
if @user
    message ="Tai khoan da ton tai"
    redirect_to signup_path, notice: message
    return false
end
@user =User.create(user_params)
if @user.errors.to_hash.empty?() ==false
   
    message =  @user.errors.to_hash[:email] ?  @user.errors.to_hash[:email].join("") : @user.errors.to_hash[:password].join("")
    redirect_to signup_path, notice:message
end

if @user.errors.to_hash.empty?() ==true
    message = "Signup success"
    
   return redirect_to root_path , alert:message
  end
    end
def show
    @user = User.find(params[:id])
end
# def update
#     @user = User.find(params[:id])
#   if @user.update(update_params)
#      redirect_to '/events'
#   else
#      flash[:errors] = @user.errors.full_messages
#      redirect_to "/users/#{@user.id}/edit"
#   end
# end
def delete
    session[:user_id] = nil
    @user = User.find(params[:id])
    @user.destroy
end


private

def user_params
    params.require(:user).permit(:email,:password)
end
end