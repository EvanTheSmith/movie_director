class Penpal < ApplicationRecord
has_many :letters
has_many :users, through: :letters

has_many :penpal_interests
has_many :interests, through: :penpal_interests

end