class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



 has_many :articles, dependent: :destroy
 has_many :comments, dependent: :destroy
 

 enum status: {pending: 0, active: 1}
 enum role: {user: 0, admin: 1}


 mount_uploader :profile_pic, AvatarUploader
#  has_one :profile_pic, dependent: :destroy
 validates_integrity_of  :profile_pic
 validates_processing_of :profile_pic




#  validates :avatar, file_size: {less_than_or_equal_to: 5.megabytes},
#  file_content_type: {allow:['image/jpeg', 'image/png', 'image/gif']}
end
