class RenameContributorIdToUserId < ActiveRecord::Migration
  def change
  	change_table :pledges do |t|
  		t.rename :contributor_id, :user_id
  	end
  end
end
