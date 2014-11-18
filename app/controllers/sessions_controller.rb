class SessionsController < ApplicationController
  
  def create
    auth = request.env['omniauth.auth']
    user = User.find(Provider.find_by_name_and_uid(auth["provider"], auth["uid"]).user_id
      || Provider.create(user_id: User.create.id, uid: auth["uid"], name: auth["provider"}) #fix this, needs to be equal to user not provider
    session(:user_id] = user.id
  end

end
