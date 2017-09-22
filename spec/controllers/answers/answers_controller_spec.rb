require 'rails_helper'

RSpec.describe Answers::AnswersController, type: :controller do
	describe "GET index" do
		it "gets all answers" do
			answers = Answer.all
			get :index
			expect(assigns(:answers)).to eq(answers)
		end
	end

	describe "GET new" do
		it "sets title" do
			get :new
			expect(assigns(:title)).not_to be_empty
		end

		it "creates new answer" do
		 	get :new
		 	expect(assigns(:answer)).not_to be_nil
		end
	end

	describe "POST create" do
		it "should successfully create answer" do
			answer = build :answer

			post :create, {:answer => {question_num: answer.question_num, part_num: answer.part_num, answer: answer.answer}}
			expect(flash[:notice]).to be_present 
			expect(Answer.last.question_num).to eq(answer.question_num) 
		end

		it "should fail becuase missing paramaters" do
			answer = build :answer
			post :create, {:answer => {question_num: answer.question_num, part_num: answer.part_num}}
			expect(flash[:error]).to be_present
			expect(Answer.all.count).to eq(0)
		end
	end

	describe "PUT update" do
		it "should update answer that is updated" do
			answer = create :answer
			answer.answer = "Updated Answer"
			put :update, {:answer => {question_num: answer.question_num, part_num: answer.part_num, answer: answer.answer}, id: answer.id }
			expect(Answer.find(answer.id).answer).to eq("Updated Answer")
		end
	end

	describe "DELETE" do
		it "should delete answer with given id" do
			answer = create :answer
			answer_count = Answer.all.count

			delete :destroy, {id: answer.id}
			expect(Answer.all.count).to eq(answer_count - 1)
		end
	end
end
