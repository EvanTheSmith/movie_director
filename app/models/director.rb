class Directors < ApplicationRecord
    has_secure_password
    has_many :movies
    has_many :actors, through: :movies
end