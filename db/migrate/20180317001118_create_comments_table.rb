class CreateCommentsTable < ActiveRecord::Migration[5.1]
  def change
  	create_table :comments do |t|
  		t.string :content
  		t.integer :student_id
  		t.integer :teacher_id
  	end
  end
end
