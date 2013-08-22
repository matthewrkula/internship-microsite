class Thought < ActiveRecord::Base
	attr_accessible :text, :link, :color

	validates :text, presence: true, length: {minimum: 5, maximum: 1000}
end
