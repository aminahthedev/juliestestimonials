get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
  @user = User.find_by(email: params[:email])
  @errors = []

  if @user && @user.authenticate(params[:password])
    set_current_user_id(@user.id)

    redirect '/'
  else
    if params[:email] == "" || params[:password] == ""
      @errors << 'Invalid email/password combination'
    end
    erb :'/sessions/new'
  end
end

delete '/sessions' do
  session.delete(:user_id)
  redirect '/'
end
