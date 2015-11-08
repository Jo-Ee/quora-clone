helpers AnswerHelper

#render a new answer form
get '/questions/:q_id/answers/new' do
	@question = Question.find_by(id: params[:q_id]) 
	erb :'answers/new'
end

#create the answer to the question
post '/questions/:q_id/answers' do
	find_question
	@user = current_user
	@answer = Answer.new(body:params[:body], question_id:params[:q_id],user_id: @user.id )
	if @answer.save
		redirect to "/answers/#{@answer.id}"
	else
		erb :'answers/new'

	end
end

#show the answer
get "/answers/:id" do
	@answer = Answer.find_by(id: params[:id])
	@question = @answer.question

	erb :'answers/show'
end

#edit answer
get "/answers/:id/edit" do
	find_answer
	@question = @answer.question
	erb :'answers/edit'

end

#update answer
put "/answers/:id" do
	find_answer
	if @answer.update(params[:answer])
		redirect to "/answers/#{@answer.id}"
	else
		erb :'answers/edit'
	end
end

#delete the question

delete "/answers/:id" do
	find_answer
	@answer.destroy
	redirect to '/'
end
