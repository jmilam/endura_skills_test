class UserAnswers::FinishController < ApplicationController
	skip_before_action :authenticate_login!
	def index
		@login = current_login
		@user_answers = @login.user_answers
	end

	def show
		@user = User.find(params[:id])
		@user_answers = Array.new
		@user.user_answers.each do |user_answer|
			@user_answers << UserAnswer.format_user_answers(user_answer)
		end
	end

	def new
	end

	def edit
	end

	def create
		@login = User.find(params[:user_id])
		UserAnswer.transaction do
			begin
				params[:user_answer].each do |key, value|
					value.each do |question_num, answer|
						question_answer = Answer.where(part_num: @stringify_part_num[key], question_num: @stringify_num[question_num]).last
						if question_answer.nil?
							next
						else
							ua = @login.user_answers.where(answer_id: question_answer.id).last
							if ua.nil?
								@login.user_answers.create(answer_id: question_answer.id, answer: answer)
							else
								UserAnswer.update(ua.id, answer: answer)
							end
						end
					end
				end
			rescue Exception => error
				p "#{error}"
			end
		end
	end

	def update
		@answer = Answer.find(params[:id])

		if @answer.update_attributes(answer_params)
			flash[:notice] = "Answer successfully updated"
			redirect_to answers_answers_path
		else
			flash[:error] = "There was an error when trying to save. Please try again.  All fields must be filled out."
			render edit_answers_answer_path(@answer)
		end
	end

	def destroy
		user = User.find(params[:id])
		user.complete = true
		user.completed_date = Date.today
		user.save
		flash[:notice] = "Successfully completed test. Please follow up with your HR representative."
	end

	private

	def answer_params
		params.require(:user_answer).permit(:user_id, :answer_id, :answer)
	end
end
