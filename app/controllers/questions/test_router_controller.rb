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
end
