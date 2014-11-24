class Subscription < ActiveRecord::Base
  belongs_to :user

  validates :media, presence: true, inclusion: { in: ["twitter", "vimeo"] }
  validates :local_id, presence: true
  validates :user_id, presence: true
end
