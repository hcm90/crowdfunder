class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :projects, :foreign_key => "owner_id"
  has_many :contributed_projects, :through => :pledges, :source => :project
end
