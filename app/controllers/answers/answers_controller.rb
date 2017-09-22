class Answers::AnswersController < ApplicationController
	def index
		@answers = Answer.all
	end

	def show
	end

	def new
		@title = "Create Answer"
		@answer = Answer.new
	end

	def edit
		@answer = Answer.find(params[:id])
	end

	def create
		@answer = Answer.new(answer_params)

		if @answer.save
			flash[:notice] = "Answer successfully created"
			redirect_to answers_answers_path
		else
			flash[:error] = "There was an error when trying to save. Please try again. All fields must be filled out."
			render new_answers_answer_path(@answer)
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
		@answer = Answer.find(params[:id])

		if @answer.delete
			flash[:notice] = "Answer successfully deleted"
			redirect_to answers_answers_path
		else
			flash[:error] = "There was an error when trying to save. Please try again."
			redirect_to answers_answers_path
		end
	end

	private

	def answer_params
		params.require(:answer).permit(:part_num, :question_num, :answer, :test_num, :exclude)
	end
end
