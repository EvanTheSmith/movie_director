class Letter < ApplicationRecord
validates_presence_of :title, :message
belongs_to :user
belongs_to :penpal
end