class Breakpoint < ActiveRecord::Base
	belongs_to :project
	has_many :users, :through => :pledges
	has_many :pledges
end
