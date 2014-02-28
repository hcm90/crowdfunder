class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :projects, :foreign_key => "owner_id"
  has_many :contributed_projects, :through => :pledges, :source => :project
  has_many :breakpoints, :through => :pledges
  has_many :pledges

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
end
