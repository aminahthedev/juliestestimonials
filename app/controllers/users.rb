get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])

  if @user.save
    set_current_user_id(@user.id)
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end
