class Checklist < ActiveRecord::Base
	validates :title, uniqueness: true, presence: true, length: {minimum: 5 }
end
