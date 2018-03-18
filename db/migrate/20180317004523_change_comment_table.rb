class ChangeCommentTable < ActiveRecord::Migration[5.1]
  def change
  	change_table :comments do |t|
  		t.remove :teacher_id, :student_id
  		t.string :user_email
  		t.string :location
  	end
  end
end
