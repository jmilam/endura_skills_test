class AddCompletedDateToLogin < ActiveRecord::Migration[5.0]
  def change
  	add_column :logins, :completed_date, :date
  end
end
