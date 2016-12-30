class RenameUserAnswerUserIdToLoginId < ActiveRecord::Migration[5.0]
  def change
  	rename_column :user_answers, :user_id, :login_id
  end
end
