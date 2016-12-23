class Answer < ApplicationRecord
	validates :part_num, :question_num, :answer, presence: true
end
