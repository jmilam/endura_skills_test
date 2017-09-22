class ChangeUserAnswerLoginIdToUserId < ActiveRecord::Migration[5.0]
  def change
  	rename_column :user_answers, :login_id, :user_id
  end
end
