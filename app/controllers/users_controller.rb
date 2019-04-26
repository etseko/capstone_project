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


  private

    def user_params
      params.require(:user).permit(:name, :surname, :email, :address,:image)
    end

end
