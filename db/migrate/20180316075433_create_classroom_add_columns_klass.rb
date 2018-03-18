class CreateClassroomAddColumnsKlass < ActiveRecord::Migration[5.1]
  def change
  	create_table :classrooms do |t|
  		t.string :name
  		t.string :location
  	end

  	add_column :klasses, :time_day, :string
  	add_column :klasses, :weeks, :integer
  	add_column :klasses, :classroom_id, :integer

  end
end
