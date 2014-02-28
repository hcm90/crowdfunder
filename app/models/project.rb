class Project < ActiveRecord::Base
	has_one :owner, :class_name => "User"
	#has_many :contributors, :through => :pledges, :class_name => "User"
	has_many :contributors, :through => :pledges, :source => :user
	has_many :pledges
	has_many :breakpoints
	has_many :contributions, :through => :pledges, :source => :breakpoint


end