class AddOwneridToKlassTable < ActiveRecord::Migration[5.1]
  def change
  	add_column :klasses, :owner_id, :integer
  end
end
