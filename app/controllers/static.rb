helpers SessionHelper

get '/' do
	@user = current_user
	@question = Question.all
	@all_users = User.all
	erb :"static/index"
end

get '/home' do
	redirect to '/'
end

