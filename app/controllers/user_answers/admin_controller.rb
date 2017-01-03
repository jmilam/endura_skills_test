class UserAnswers::AdminController < ApplicationController
	def index
		@logins = Hash.new
		Login.all.each do |login|
			correct_count = UserAnswer.calculate_correct_count(login.user_answers)
			total_answers = Answer.all.count
			@logins["#{login.email}"] = {id: login.id, correct_count: correct_count, total_answers: total_answers, percent: UserAnswer.calculate_percent(correct_count, total_answers), completed_date: login.completed_date}
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
