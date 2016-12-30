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
end
