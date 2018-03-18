class ChangeKlassTable < ActiveRecord::Migration[5.1]
  def change
  	change_table :klasses do |t|
  		t.remove :teacher_id, :classroom_id, :grade
  		t.string :location
  		t.string :description
  	end

  	drop_table :student_klasses
  	drop_table :students
  	drop_table :teachers
  	drop_table :classrooms
  	drop_table :student_assignments

  	create_table :user_klasses do |t|
  		t.integer :klass_id
  		t.integer :user_id
  	end

  	create_table :user_assignments do |t|
  		t.integer :assignment_id
  		t.integer :user_id
  	end

  end
end
