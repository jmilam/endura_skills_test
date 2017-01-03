class QuestionsController < ApplicationController
	def index
		if current_login.admin?
			redirect_to user_answers_admin_index_path
		else
			if current_login.complete
				flash[:error] = "Test has already been completed. Please contact HR if there is an issue."
				sign_out(current_login)
				redirect_to new_login_session_path
			end
		end
	end

	def destroy
		current_login.complete = true
		current_login.save
		flash[:notice] = "You have reached the end of your time. All answers have been saved. Please follow up with your HR representative."
		sign_out(current_login)
	end
end
