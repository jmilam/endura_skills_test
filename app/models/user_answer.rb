class UserAnswer < ApplicationRecord
	belongs_to :user

	def self.calculate_correct_count(user_answers)
		count = 0
		user_answers.each do |user_answer|
				user_answer.answer == Answer.find(user_answer.answer_id).answer ? count += 1 : count unless Answer.find(user_answer.answer_id).exclude == true
		end
		count
	end

	def self.format_user_answers(user_answer)
		find_answer = Answer.find(user_answer.answer_id)
		{part_num: find_answer.part_num, question_num: find_answer.question_num, user_answer: user_answer.answer, correct_answer: find_answer.answer}
	end

	def self.calculate_percent(correct_count, total_answers)
		((correct_count.to_f / total_answers.to_f) * 100).round
	end

	def self.build_html_table_from_data(user_answers)
		return_value = "<table class='table table'>
											<thead>
												<tr>
													<td colspan='3' class='text-center'> <strong>Please Verify Answers and then Complete test at the bottom:</strong> </td>
												</tr>
												<tr>
													<td>Part Num</td>
												  <td>Question Num</td>
												  <td>Answer</td>
												</tr>
											</thead>
											<tbody>"
		user_answers.each do |user_answer|
			value = "<tr>
				<td>#{Answer.find(user_answer.answer_id).part_num}</td>
				<td>#{Answer.find(user_answer.answer_id).question_num}</td>
				<td>#{user_answer.answer}</td>
			</tr>"

			return_value << value
		end

		return_value << "</tbody></table>"
		return_value
	end

	def self.get_answer(part_num, question_num, user_answers, test_num=1)
		answers = user_answers.select {|question| question[:part_num] == part_num && question[:question_num] == question_num}.first
		answers[:user_answer] unless answers.nil?
	end

	def self.correct?(part_num, question_num, user_answers, test_num=1)
		user_answer = user_answers.select {|question| question[:part_num] == part_num && question[:question_num] == question_num}.first
		if user_answer.nil?
			"<span class='glyphicon glyphicon-remove text-danger' aria-hidden='true'></span>".html_safe
		else
			if part_num == 5
				answer_equal = user_answer[:user_answer].to_i == user_answer[:correct_answer].to_i
			else
				answer_equal = user_answer[:user_answer].downcase == user_answer[:correct_answer].downcase
			end
			
			if answer_equal
				"<span class='glyphicon glyphicon-ok text-success' aria-hidden='true'></span>".html_safe
			else
				"<span class='glyphicon glyphicon-remove text-danger' aria-hidden='true'></span>".html_safe
			end
		end
	end
end
