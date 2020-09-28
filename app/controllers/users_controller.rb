class UsersController < ApplicationController

  def show; end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render user_path(current_user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
