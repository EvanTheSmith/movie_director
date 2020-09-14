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

# Scope Methods

scope :alphabetically, -> { order(first_name: :asc) }
scope :by_interest, -> (int_id) { joins(:interests).where(interests: {id: int_id}) }
scope :by_frequency, -> (freq) { where(frequency: freq) }
scope :by_penpal, -> (penpal_id) { where(id: penpal_id) }

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