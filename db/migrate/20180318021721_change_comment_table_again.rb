class ChangeCommentTableAgain < ActiveRecord::Migration[5.1]
  def change
  	remove_column :comments, :user_email, :string
  	add_column :comments, :user_id, :integer
  end
end
