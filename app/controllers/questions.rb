# render a new form

get '/questions/new' do
	erb :'questions/new'
end

#create question
post '/questions' do
	@user = current_user
	@question = @user.questions.new(params[:question])

	if @question.save
		redirect to "/questions/#{@question.id}"
	else
		erb :'questions/new'
	end
end	

#show the question
get '/questions/:id' do
	@user = current_user
	@question = Question.find_by(id: params[:id])
	@user_question = User.find_by(id: @question.user_id)
	@answers = Answer.where(question_id: params[:id])
	erb :'questions/show'
end

#render edit form
get '/questions/:id/edit' do
	@question = Question.find_by(id: params[:id])
	erb :'questions/edit'
end

#update the question
put '/questions/:id' do
	@question = Question.find_by(id: params[:id])
	if @question.update(params[:question])
		redirect to "/questions/#{@question.id}"
	else
		erb :'questions/edit'
	end
end


#delete the question
delete '/questions/:id' do
	@question = Question.find_by(id: params[:id])
	@question.destroy
	redirect to '/'
end