class User < ApplicationRecord
validates :username, presence: true, uniqueness: true
has_secure_password
validate :not_already_exist_via_fb

def not_already_exist_via_fb
 @user = User.find_by(:username => username)
  if @user && @user.fb_id
   errors.delete(:username)
   errors.delete(:password)
   errors.add(:user, "must login via Facebook.")
  end
end

end