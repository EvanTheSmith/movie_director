module UsersHelper

def can_find(params)
 User.find_by(username: params[:username])
end

end