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
        # redirect_to "/", notice: "Already linked that account!"
      else
        @provider.user = current_user
        @provider.save()
        # redirect_to "/", notice: "Successfully linked that account!"
      end
    else
      if @provider.user.present?
        self.current_user = @provider.user
        # redirect_to "/", notice: "Please finish registering"
      end
    end
    redirect_to "/"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
