class Questions::TestTwoController < ApplicationController
	skip_before_action :authenticate_login!
	def index
		if current_login.nil?
		else
			redirect_to user_answers_admin_index_path
		end
	end

	def destroy
	end
end
