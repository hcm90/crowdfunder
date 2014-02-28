class AddBreakpointIdToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :breakpoint_id, :integer
  end
end
