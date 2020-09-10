class Letter < ApplicationRecord
belongs_to :user
belongs_to :penpal

scope :my_letters, -> { where(user: User.find_by_id(1)) } # This is not working lol

end