class User < ActiveRecord::Base
	has_many :projects, :through :pledges => "Contributor"
	has_many :projects, :class_name => "Owner"
end
