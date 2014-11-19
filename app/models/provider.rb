class Provider < ActiveRecord::Base
  belongs_to :user

  def self.find_with_omniauth(auth)
    find_by(uid: auth['uid'], name: auth['provider'], user_id: ) ####
  end

  def self.create_with_omniauth(auth)
    create(uid: auth['uid'], name: auth['provider']), user_id: )###
  end
end
