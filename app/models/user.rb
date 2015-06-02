class User < ActiveRecord::Base

  mount_uploader :profile_picture, ProfilePictureUploader
  mount_uploader :profile_background, ProfileBackgroundUploader

end
