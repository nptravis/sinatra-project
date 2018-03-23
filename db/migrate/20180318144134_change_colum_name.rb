class ChangeColumName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :klasses, :owner_id, :user_id
  end
end
