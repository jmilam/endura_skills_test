class UserAnswers::AdminController < ApplicationController
	skip_before_action :authenticate_login!
	def index
		begin
			@users = Hash.new
			User.all.each do |user|
				correct_count = UserAnswer.calculate_correct_count(user.user_answers)
				total_answers = Answer.where("test_num = ? AND exclude = ?", user.test_num, false).count
				@users["#{user.email}"] = {id: user.id, first_name: user.first_name, last_name: user.last_name, correct_count: correct_count, total_answers: total_answers, percent: UserAnswer.calculate_percent(correct_count, total_answers), completed_date: user.completed_date}
			end
		rescue Exception => e 
		  p "Exception #{e}"
		end
	end

	def show
	end

	def new
	end

	def edit
	end

	def create
	end

	def update

	end

	def destroy

	end

end
