class User < ActiveRecord::Base
  has_many :providers
  has_many :subscriptions

  def self.create_with_omniauth(info)
    create #no name here
  end
end
