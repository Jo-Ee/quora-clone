module AnswerHelper

	#find questions based on question id
	def find_question
		@question = Question.find_by(id: params[:q_id]) 
	end

	#find answers based on answer id
	def find_answer
		@answer = Answer.find_by(id: params[:id])
	end

end