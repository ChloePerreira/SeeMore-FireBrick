class SessionsController < ApplicationController

  def create
    # Log the user in here:
    auth = request.env['omniauth.auth']
    @provider = Provider.find_with_omniauth(auth)
    if @provider.nil?
      @provider = Provider.create_with_omniauth(auth)
      @user = User.create(name: auth['info']['name'])
      @provider.user_id = @user.id
      @provider.save
    end

    if signed_in?
      if @provider.user == current_user
         flash[:notice] = "Already linked that account!"
      else
        @provider.user = current_user
        @provider.save()
         flash[:notice] = "Successfully linked that account!"
      end
    else
      if @provider.user.present?
        self.current_user = @provider.user
        flash[:notice] = "You have been successfully signed in."
      else
        flash[:notice] = "Please finish registering"
      end
    end
    redirect_to root_path
  end
  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been successfully logged out."
    redirect_to root_path
  end
end
