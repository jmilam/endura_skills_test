class QuestionsController < ApplicationController
	def index
		if current_login.admin?
			redirect_to user_answers_admin_index_path
		end
	end
end
