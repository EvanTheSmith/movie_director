class Letter < ApplicationRecord
validates_presence_of :title, :message
belongs_to :user
belongs_to :penpal

def self.by_user(user)
 where(user: user)
end

def self.by_penpal(penpal_id)
 where(penpal: penpal_id)
end

end