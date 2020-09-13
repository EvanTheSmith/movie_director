class Penpal < ApplicationRecord
validates_presence_of :name
validates_numericality_of :age, :message => "required and must be a number"
validate :has_one_or_more_interests

has_many :letters
has_many :users, through: :letters
has_many :penpal_interests
has_many :interests, through: :penpal_interests

def has_one_or_more_interests
 if interests.empty?
 errors.add(:interest_ids, "required. Must select one interest.")
 end
end

def self.by_penpal(penpal_id)
 where(id: penpal_id)
end

def self.all_alphabetically
 all.sort_by(&:name)
end

def letters_from_me(me)
 letters.where(user: me)
end

def first_name
 self.name.split[0]
end

end