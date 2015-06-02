class User < ActiveRecord::Base

  mount_uploader :profile_picture, ProfilePictureUploader

end
