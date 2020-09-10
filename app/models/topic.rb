class Topic < ApplicationRecord
    has_many :penpal_topics
    has_many :penpals, through: :penpal_topics
end