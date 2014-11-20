class Subscription < ActiveRecord::Base
  belongs_to :user

  validates :media, presence: true
  validates :local_id, presence: true
  validates :user_id, presence: true
end
