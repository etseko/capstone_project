class UsersController < ApplicationController

  def index
  @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  # GET /user/1/edit
def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to current_user, notice: 'Your profile was successfully updated.'
    else
      render :edit
    end
end

def generateuid
  @user = User.find(params[:id])
  if @user.auth_token == nil
    set_access_token
  end

  @user_auth =  @user.auth_token
  redirect_to current_user, notice: 'Your uid is: '+ @user_auth
end


  private

    def set_access_token
      @user = User.find(params[:id])
      #@user.auth_token = generate_token
      @user.update(:auth_token => generate_token)


    end

    def generate_token
        token = SecureRandom.hex(10)
    end

    def user_params
      params.require(:user).permit(:name, :surname, :email, :address,:auth_token, :image)
    end

end
