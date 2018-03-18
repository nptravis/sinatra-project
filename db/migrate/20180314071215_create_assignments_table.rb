class CreateAssignmentsTable < ActiveRecord::Migration[5.1]
  def change
  	create_table :assignments do |t|
  		t.string :instructions
  		t.string :student_content
  		t.string :teacher_comments
  		t.string :mark
  	end
  end
end
