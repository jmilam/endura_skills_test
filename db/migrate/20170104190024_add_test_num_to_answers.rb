class AddTestNumToAnswers < ActiveRecord::Migration[5.0]
  def change
  	add_column :answers, :test_num, :int
  end
end
