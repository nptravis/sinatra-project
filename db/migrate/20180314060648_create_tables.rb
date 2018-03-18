class CreateTables < ActiveRecord::Migration[5.1]
  def change
  	
  	create_table :teachers do |t|
  		t.string :first_name
  		t.string :last_name
  		t.string :email
  		t.string :password
  		t.string :password_digest
  		t.string :subject
  	end

  	create_table :students do |t|
  		t.string :first_name
  		t.string :last_name
  		t.string :email
  		t.string :password
  		t.string :password_digest
  		t.integer :grade
  	end

  	create_table :admins do |t|
  		t.string :first_name
  		t.string :last_name
  		t.string :email
  		t.string :password
  		t.string :password_digest
  		t.string :title
  	end

  	create_table :klasses do |t|
  		t.string :name
  		t.integer :grade
  		t.string :subject
  	end

  	create_table :klass_joins do |t|
  		t.integer :klass_id
  		t.integer :student_id
  		t.integer :assignment_id
  		t.integer :teacher_id
  	end

  end
end
