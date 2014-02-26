class User < ActiveRecord::Base
	
	has_many :projects, :foreign_key => "owner_id"
	#has_many :owned_projects, :class_name => "Project"


	has_many :contributed_projects, :through => :pledges, :source => :project




	#has_many :projects, :through :pledges, :class_name => "Contributor"
	#has_many :projects, :class_name => "Owner"
end