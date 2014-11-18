class SessionsController < ApplicationController

  def create
    # Log the user in here:
    auth = request.env['omniauth.auth']
    @provider = Provider.find_with_omniauth(auth)

    if @provider.nil?
      @provider = Provider.create_with_omniauth(auth)
    end

    if signed_in?
      if @provider.user == current_user
        redirect_to root_path, notice: "Already linked that account!"
      else
        @provider.user = current_user
        @provider.save()
        redirect_to root_path, notice: "Successfully linked that account!"
      end
    else
      if @provider.user.present?
        self.current_user = @provider.user
        redirect_to root_path, notice: "Please finish registering"
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
