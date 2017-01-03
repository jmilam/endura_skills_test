class UserAnswer < ApplicationRecord
	belongs_to :login

	def self.calculate_correct_count(user_answers)
		count = 0
		user_answers.each do |user_answer|
				user_answer.answer == Answer.find(user_answer.answer_id).answer ? count += 1 : count
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
end
