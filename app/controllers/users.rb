helpers SessionHelper

#show user's questions
get '/user/:id/questions' do
	@user = current_user
	@question = Question.where(user_id: @user.id)
	erb :'users/show_questions'
	
end

#show user's answers and the question
get '/user/:id/answers' do
	@user = current_user
	@answer = Answer.where(user_id: @user.id)
	erb :'users/show_answers'	
end