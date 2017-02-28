class Questions::TestRouterController < ApplicationController
	skip_before_action :authenticate_login!
	def index
		if current_login.nil?
			tests = [questions_test_one_index_path, questions_test_two_index_path]
			redirect_to tests.sample
		else
			redirect_to user_answers_admin_index_path
		end
	end

	def destroy
		user = User.find(params[:id])
		user.complete = true
		user.completed_date = Date.today
		user.save

		flash[:notice] = "You have reached the end of your time. All answers have been saved. Please follow up with your HR representative."
	end
end
