class Checklist < ActiveRecord::Base
	has_many :tasks
	accepts_nested_attributes_for :tasks, :reject_if => lambda { |b| b[:description].blank? }
	if false
			# attr_accessible :tasks_attributes
	end

	validates :title, uniqueness: true, presence: true, length: {minimum: 5 }

	
end

