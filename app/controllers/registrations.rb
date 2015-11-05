get '/signup'  do
	erb :'registrations/signup'
end

post '/signup' do
	@user = User.new(params[:user])
	if @user.save
		session[:user_id] = @user.id
		redirect to "/"
	else
		erb :'registrations/signup'
	end
end