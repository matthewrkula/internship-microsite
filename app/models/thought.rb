class Thought < ActiveRecord::Base
	attr_accessible :text, :link

	validates :text, presence: true, length: {minimum: 5, maximum: 140}
end
