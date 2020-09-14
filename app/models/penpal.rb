class Penpal < ApplicationRecord
validates_presence_of :name
validates_numericality_of :age, :message => "required and must be a number"
validate :has_one_or_more_interests

has_many :letters
has_many :users, through: :letters
has_many :penpal_interests
has_many :interests, through: :penpal_interests

# Validations

def has_one_or_more_interests
 if interests.empty?
 errors.add(:interest_ids, "required. Must select one interest.")
 end
end

# Class Methods

def self.by_penpal(penpal_id)
 where(id: penpal_id)
end

def self.all_alphabetically
 all.sort_by(&:name)
end

# Instance Methods

def display_interests
 interests.collect {|interest| interest.name }.join(", ")
end

def letters_from_me(me)
 letters.where(user: me)
end

def name
 first_name+" "+last_name
end

end