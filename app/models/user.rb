class User < ApplicationRecord
validates :username, presence: true, uniqueness: true
validate :not_already_exist_via_fb
has_secure_password

def not_already_exist_via_fb
 @user = User.find_by(:username => username)
  if @user && @user.fb_id
   errors.delete(:username)
   errors.add(:user, "already registered via Facebook.")
  end
end

end