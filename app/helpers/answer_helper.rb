module AnswerHelper

	def find_question
		@question = Question.find_by(id: params[:q_id]) 
	end

	def find_answer
		@answer = Answer.find_by(id: params[:id])
	end

end