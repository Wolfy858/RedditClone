get 'subs/posts/:post_id/comments/new' do
  @post = Post.find(params[:post_id])
  @comment = Comment.new
  # erb :
end

post "/subs/posts/:post_id/comments" do
  post = Post.find(params[:post_id])
  Comment.create!(commentable_id: post.id, commentable_type: 'Post', user_id: current_user.id, content: params[:content] )

end
