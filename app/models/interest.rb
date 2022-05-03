class Interest < ApplicationRecord
    has_many :penpal_interests
    has_many :penpals, through: :penpal_interests
end