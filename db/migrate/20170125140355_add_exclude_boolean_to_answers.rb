class AddExcludeBooleanToAnswers < ActiveRecord::Migration[5.0]
  def change
  	add_column :answers, :exclude, :boolean, default: false
  end
end
