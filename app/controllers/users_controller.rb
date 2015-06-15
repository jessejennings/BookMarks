class UsersController < ApplicationController


  def index
    @users = User.find(params[:id])
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path(current_user)
    else
      flash[:error] = "Invalid user information"
      redirect_to edit_user_registration_path
    end
  end

  def show
    @user = User.find(params[:id])
    @bokkmarks = @user.bookmarks.visible_to(current_user)
  end




  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end