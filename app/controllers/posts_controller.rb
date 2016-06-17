get '/subs/:id/posts/new' do
  @sub = Sub.find(params[:id])
  @post = Post.new
  erb :'/posts/new'
end

post "/subs/:id/posts" do
  @post = Post.new(params[:post])
  @sub = Sub.find(params[:id])
  @post.author = current_user
  @post.sub = @sub

  if @post.save
    redirect "/subs/#{@sub.id}"
  else
    erb :'/posts/new'
  end
end

get "/subs/:sub_id/posts/:id" do
  @post = Post.find(params[:id])
  erb :"/posts/show"
end

