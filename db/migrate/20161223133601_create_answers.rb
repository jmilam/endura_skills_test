class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.integer			:part_num
      t.integer			:question_num
      t.string			:answer
      t.timestamps
    end
  end
end
