get '/' do
  redirect '/subs'
end

get '/subs' do
  @subs = Sub.all
  erb :'/subs/index'
end

get '/subs/new' do
  @sub = Sub.new
  erb :'/subs/new'
end

get '/subs/:id' do
  @sub = Sub.find(params[:id])
  erb :"/subs/show"
end

