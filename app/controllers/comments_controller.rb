# get 'subs/posts/:post_id/comments/new' do
#   @post = Post.find(params[:post_id])
#   @comment = Comment.new
#   # erb :
# end

post "/subs/posts/:post_id/comments" do
  @post = Post.find(params[:post_id])
  sub_id = @post.author_id
  Comment.create!(commentable: @post , user: current_user, content: params[:content] )
  redirect "/subs/#{sub_id}/posts/#{@post.id}"
end

