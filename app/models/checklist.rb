require 'json'

class Checklist < ActiveRecord::Base
	has_many :tasks, dependent: :destroy
	accepts_nested_attributes_for :tasks, :reject_if => lambda { |b| b[:description].blank? }
	if false
			# attr_accessible :tasks_attributes
	end

	validates :title, uniqueness: true, presence: true, length: {minimum: 5 }

    def self.create_instance(template, garant)
        checklist = Checklist.new({ 
        title: template.title + '-V' + template.template_version.to_s ,
    	description: template.description,
    	created_at: template.created_at,
    	updated_at: template.updated_at,
    	status: template.status,
    	progess: 1,
    	garant: garant,
    	timeStarted: DateTime.now.to_formatted_s(:long_ordinal),
    	timeFinished: template.timeFinished,
    	createur: template.createur,
        template_version: template.template_version
        })

        template.tasks.each do |task|
            checklist.tasks.new({
                description: task.description,
                status: false,
                created_at: task.created_at,
                updated_at: task.updated_at
                })
        end
        checklist.save
        template.template_version = template.template_version + 1
        template.save
        print "\n" 
        print "\n" 
        print "\n" 
        print "\n" 
        print "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    	print checklist.to_json

    	checklist
    end
	
end

