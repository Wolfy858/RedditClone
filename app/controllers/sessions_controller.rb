get '/session-viewer' do
  session.inspect
end


# Log in as an existing user
get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  # user = User.find_by(email: params[:user][:email])
  user = User.authenticate(params[:user][:email], params[:user][:password])

  # if user && user.password == params[:user][:password]
  if user
    session[:user_id] = user.id
    redirect "/restaurants"
  else
    status 422
    @errors = ["Sorry, the credentials provided do not match."]
    erb :'/sessions/new'
  end
end
