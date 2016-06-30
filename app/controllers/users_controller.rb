class UsersController < ApplicationController

  before_action :set_user, only: :finish_signup
  layout "persons", only: [:edit, :update]

	# GET/PATCH /users/:id/finish_signup
  def finish_signup
    # authorize! :update, @user 
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update(user_params)
        # @user.skip_reconfirmation!
        sign_in(@user, bypass: true)
        redirect_to user_root_path, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    @user.update params.require(:user).permit!
    if @user.valid?
      redirect_to profile_path
    else
      render :edit
    end
  end

private
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    accessible = [ :name, :email ] # extend with your own params
    accessible << [ :password, :password_confirmation, :current_password ] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end

end
