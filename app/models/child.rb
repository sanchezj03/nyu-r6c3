# == Schema Information
# Schema version: 51
#
# Table name: children
#
#  birthday              :datetime      
#  child_id              :integer       
#  child_is_linked       :integer       
#  child_school_id       :integer       
#  childschoolId2        :integer       
#  cohort                :integer       
#  collected_on          :datetime      
#  comments              :string(255)   
#  created_on            :datetime      
#  dt                    :string(100)   default("getdate")
#  first_name            :string(255)   
#  gender                :string(1)     
#  hispanic              :integer       
#  id                    :integer       not null, primary key
#  is_primary            :integer       
#  last_name             :string(255)   
#  linked_child          :string(255)   
#  race                  :string(255)   
#  recruitment_id        :integer       
#  secondary_yoked_child :string(255)   
#  user_id               :integer       
#  yoked_pair            :integer       
#

class Child < ActiveRecord::Base
  has_many :caregivers, :order => "created_on DESC"
  has_many :eligibilities, :order => "created_on DESC"
  has_many :locations, :order => 'created_on DESC'
  has_many :consents, :order => "phase DESC, created_ON DESC"
  has_many :blue_card_entries
  has_many :consent_outcomes
  has_many :interviews

  serialize :race
  attr_accessor :other_race
  
  validates_presence_of :first_name, :last_name, :cohort
  validates_format_of :recruitment_id, :with => /^6[1-4][0-9]{3}$/, :on => :update
  validates_inclusion_of :cohort, :in => 1..4
  
  # Let's validate everything only if it was inputed
  validates_format_of :child_id, :with => /^6[1-4][0-9]{4}$/, :if => :child_id
  validates_inclusion_of :gender, :in => %w{ m f }, :if => :gender
  
  before_save :empty_race_if_nonexistent
  after_create :save_recruitment_id

	# Location objects
	def pre_k_locations
		locations.find_all_by_type('PreKLocation')
	end
	
	def k_locations
		locations.find_all_by_type('KLocation')
	end
  
	def caregiver
		caregivers.find(:first)
	end
  
  # Races are hard coded.
  def self.RACES
    ["African American","AfroCaribbean","African","White"]
  end
  
  # What race is this child?
  def is_of_race?(outside_race)
    race.index(outside_race) != nil
  end

  # Races are bunched in with Child.race. Root it out if it's not one of the hard coded races.
  def other_race
    race.each do |r|
      return r if !Child.RACES.include?(r)
    end
  end
  
  # Return the races; An array if not set yet (new record, for example)
  def race
    read_attribute(:race) || []
  end
  
  # Root out the empty race strings
  def race= (races)
    write_attribute(:race, races - [""])
  end
  
  # The most recent one determines the eligibility
  def eligibility
    eligibilities.find(:first) || Eligibility.new
  end
  
  def child_is_linked
  read_attribute(:child_is_linked).eql?(1)
  end
    
  # Is he eligible?
  def eligible?
    eligibility.eligible
  end
  
  def name
    first_name + " " + last_name
  end
  
  def pronoun
    gender == "m" ? "he" : "she"
  end
  
  def sex
    case gender
      when "m" then "male";
      when "f" then "female";
      else "Not specified";
    end
  end
 
  # Child is created once a caregiver consents for them
  def create_child_id
    return unless child_id.nil?
    
    recent = Child.find(:first, :conditions => ["cohort = ? and child_id IS NOT NULL", cohort], :select => "child_id", :order => "child_id DESC")
    last_child_id = recent != nil ? recent.child_id.to_i : "6#{cohort}0000".to_i
    
	write_attribute(:child_id, last_child_id + 1)
	save
	
    return last_child_id
  end
 
 private 
 
 def save_recruitment_id
      most_recent = Child.find(:first, :conditions => ["cohort = ? and recruitment_id != ?", cohort, self.id], :select => "recruitment_id", :order => "recruitment_id DESC")
      last_id = most_recent != nil ? most_recent.recruitment_id : "6#{cohort}000".to_i
      
      self.update_attribute(:recruitment_id, last_id +1)
      self.save
    end
    
    # When editing, if all the races are unchecked, nothing is sent to this model to be updated.
    # So when the editor wants to remove all races, the last one does not get removed.
    # We have to set it to an empty array manually if the races are not sent
    def empty_race_if_nonexistent
      #if self.race == nil or 
      self.write_attribute(:race, []) if [Array.new, nil, ""].include?(self.race)
    end 
end
