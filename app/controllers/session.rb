get '/login' do
	erb :'sessions/login'
end

post '/login' do
	@user = User.authenticate(params[:email], params[:password])
	if @user
		session[:user_id] = @user.id
		redirect to "/"
	else
		@message = "Email or password is invalid"
		erb :"sessions/login"
	end
end

delete '/logout' do
	session[:user_id] = nil
	redirect to "/"
end