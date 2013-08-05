class Thought < ActiveRecord::Base
	attr_accessible :text

	validates :text, presence: true, length: {minimum: 5, maximum: 140}
end
