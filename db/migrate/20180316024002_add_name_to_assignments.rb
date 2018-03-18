class AddNameToAssignments < ActiveRecord::Migration[5.1]
  def change
  	add_column :assignments, :name, :string
  end
end
