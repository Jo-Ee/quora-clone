helpers QuestionHelper

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
	@question = find_question
	@user_question = User.find_by(id: @question.user_id)
	@answers = Answer.where(question_id: params[:id])
	erb :'questions/show'
end

#to vote for answer
post '/questions/:id' do
	@question = find_question
	@answervote = Answervote.new(params[:answervote])
	@answervote.save
	redirect to "/questions/#{@question.id}"
end

#to vote for question
post '/questions/:id/vote' do
	@user = current_user
	@question = find_question
	@questionvote = Questionvote.new(params[:questionvote])
	@questionvote.save
	redirect to "/questions/#{@question.id}"
end


#render edit form
get '/questions/:id/edit' do
	@question = find_question
	erb :'questions/edit'
end

#update the question
put '/questions/:id' do
	@question = find_question
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