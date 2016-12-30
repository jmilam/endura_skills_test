class UserAnswers::AdminController < ApplicationController
	def index
		@logins = Hash.new
		Login.all.each do |login|
			@logins["#{login.email}"] = {id: login.id, correct_count: UserAnswer.calculate_correct_count(login.user_answers), total_answers: Answer.all.count}
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
