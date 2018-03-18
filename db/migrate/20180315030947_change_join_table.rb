class ChangeJoinTable < ActiveRecord::Migration[5.1]
  def change
  	drop_table :klass_joins

  	create_table :student_klasses do |t|
  		t.integer :student_id
  		t.integer :klass_id
  	end
  end
end
