class AddIds < ActiveRecord::Migration[5.1]
  def change
  	add_column :klasses, :teacher_id, :integer
  	add_column :assignments, :student_id, :integer
  end
end
