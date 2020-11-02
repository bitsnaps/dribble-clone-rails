class Shot < ActiveRecord::Base

  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :user_shot, UserShotUploader

end
