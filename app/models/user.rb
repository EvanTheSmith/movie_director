class User < ApplicationRecord
validates :username, presence: true, uniqueness: true
has_secure_password
validate :not_created_by_fb

has_many :letters
has_many :penpals, through: :letters

def not_created_by_fb
 user = User.find_by(:username => username)
 if user && user.fb_id
  errors.delete(:username)
  errors.delete(:password)
  errors.add(:user, "must login via Facebook.")
 end
end

def add_login_errors(params)
 errors.delete(:username) if User.find_by(username: params[:username]) # don't check if "username taken"
 
 errors.add(:username, "not found") if !params[:username].empty? && !User.find_by(username: params[:username]) # add error if local-login user doesn't exist
 errors.delete(:password) if errors[:username].include?("not found") # don't validate password for unknown users
 
 errors.add(:password) if User.find_by(username: params[:username]) && errors[:password].empty? # confirm if password is invalid for known local users

  if fb_user = User.find_by(username: params[:username]) # dont password error for Facebook users
  errors.delete(:password) if fb_user.fb_id 
  end
end

end