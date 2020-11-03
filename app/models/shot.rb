class Shot < ActiveRecord::Base

  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :user_shot, UserShotUploader

  is_impressionable
  is_impressionable #:counter_cache => true # need to add "counter_cache" column to the table
  acts_as_votable

end
