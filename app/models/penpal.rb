class Penpal < ApplicationRecord
has_many :letters
has_many :users, through: :letters

has_many :penpal_topics
has_many :topics, through: :penpal_topics
end