class PenpalTopic < ApplicationRecord
    belongs_to :penpal
    belongs_to :topic
end