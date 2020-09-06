class User < ApplicationRecord
validates :username, presence: true, uniqueness: true
has_secure_password
validate :not_created_by_fb

def not_created_by_fb
 user = User.find_by(:username => username)
 if user && user.fb_id
  errors.delete(:username)
  errors.delete(:password)
  errors.add(:user, "must login via Facebook.")
 end
end

end