get '/' do
  redirect '/subs'
end

get '/subs' do
  @subs = Sub.all
  erb :'/subs/index'
end

get '/subs/new' do
  redirect '/sessons/new' unless logged_in?
  @sub = Sub.new
  erb :'/subs/new'
end

post '/subs' do
  redirect '/sessons/new' unless logged_in?
  @sub = Sub.new(params[:sub])
  @sub.moderator = current_user

  if @sub.save
    redirect '/subs'
  else
    erb :'/subs/new'
  end
end

get '/subs/:id' do
  @sub = Sub.find(params[:id])
  erb :"/subs/show"
end

get '/subs/:id/edit' do
  @sub = Sub.find(params[:id])
  redirect '/subs' unless current_user == @sub.moderator
  erb :'/subs/edit'
end

patch "/subs/:id" do
  @sub = Sub.find(params[:id])
  redirect '/subs' unless current_user == @sub.moderator
  @sub.update(params[:sub])

  if @sub.valid?
    redirect '/subs'
  else
    erb :"/subs/edit"
  end
end
