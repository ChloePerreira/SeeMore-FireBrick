class Provider < ActiveRecord::Base
  belongs_to :user

  validates :uid, presence: true
  
  def self.find_with_omniauth(auth)
    find_by(uid: auth['uid'], name: auth['provider'])
  end

  def self.create_with_omniauth(auth)
    create(uid: auth['uid'], name: auth['provider'])
  end
end
