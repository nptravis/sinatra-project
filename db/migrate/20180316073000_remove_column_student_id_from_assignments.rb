class RemoveColumnStudentIdFromAssignments < ActiveRecord::Migration[5.1]
  def change
  	remove_column :assignments, :student_id
  end
end
