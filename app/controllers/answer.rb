#render a new answer form
get '/questions/:q_id/answers/new' do
	@question = Question.find_by(id: params[:q_id]) 
	erb :'answers/new'
end

#create the answer to the question
post '/questions/:q_id/answers' do
	@user = current_user
	@answer = Answer.new(body:params[:body], question_id:params[:q_id],user_id:params[@user.id] )
	if @answer.save
		redirect to "/answers/#{@answer.id}"
	else
		erb :'questions/new'

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
	@answer = Answer.find_by(id: params[:id])
	erb :'answers/edit'

end

#update answer
put "/answers/:id" do
	@answer = Answer.find_by(id: params[:id])

	if @answer.update(params[:answer])
		redirect to "/answers/#{@answer.id}"
	else
		erb :'answers/edit'
	end

end

#delete the question

delete "/answers/:id" do
	@answer = Answer.find_by(id: params[:id])
	@answer.destroy
	redirect to '/'
end
