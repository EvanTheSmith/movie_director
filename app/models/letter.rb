class Letter < ApplicationRecord
belongs_to :user
belongs_to :penpal

def self.by_penpal(penpal_id)
where(penpal: penpal_id)
end

end