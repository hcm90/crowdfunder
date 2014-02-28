class Project < ActiveRecord::Base
	has_one :owner, :class_name => "User"
	#has_many :contributors, :through => :pledges, :class_name => "User"
	has_many :contributors, :through => :pledges, :source => :user
	has_many :pledges, :through => :breakpoints, :source => :pledges
	has_many :breakpoints


end