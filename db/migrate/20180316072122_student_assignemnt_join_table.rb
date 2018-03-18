class StudentAssignemntJoinTable < ActiveRecord::Migration[5.1]
  def change

  	create_table :student_assignments do |t|
  		t.integer :student_id
  		t.integer :assignment_id
  		t.string :student_content
  		t.string :teacher_comments
  		t.string :grade
  	end

  	add_column :assignments, :due_date, :string
  	remove_column :assignments, :student_content
  	remove_column :assignments, :teacher_comments
  	remove_column :assignments, :mark
  	
  end
end
