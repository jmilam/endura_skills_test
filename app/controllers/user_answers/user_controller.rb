class UserAnswers::UserController < ApplicationController
	skip_before_action :authenticate_login!
	def index
	end

	def show
	end

	def new
	end

	def edit
	end

	def create
		begin
				login = params["login"]
				user = User.create(first_name: login["first_name"], last_name: login["last_name"], email: login["email"])
				respond_to do |format|
   			  format.json { render json: {"user_id" => user.id}}
   			end
		rescue Exception => error
			p "#{error}"
		end
	end

	def update
	end

	def destroy
	end

	private

	def answer_params
		params.require(:user_answer).permit(:user_id, :answer_id, :answer)
	end
end
