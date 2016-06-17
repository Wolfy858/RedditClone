post '/comments/:id/votes' do
  @new_vote = Vote.new(user: current_user, upvote: params[:upvote])
  @comment = Comment.find(params[:id])
  @post = @comment.commentable
  @new_vote.voteable = @comment
  if @new_vote.save
    hash = { id: params[:id], karma: @comment.karma}
    if request.xhr?
      hash.to_json
    else
      redirect "/subs/#{@post.sub.id}/posts/#{@post.id}"
    end
  else
    if request.xhr?
      status 422
    else
      erb :'/posts/show'
    end
  end
end

post "/posts/:id/votes" do
  puts "==================="
  p params[:upvote]
 @new_vote = Vote.new(user: current_user, upvote: params[:upvote])
  @post = Post.find(params[:id])
  @new_vote.voteable = @post

  if @new_vote.save
    hash = { id: params[:id], karma: @post.karma}
    if request.xhr?
      hash.to_json
    else
      redirect "/subs/#{@post.sub.id}/posts/#{@post.id}"
    end
  else
    if request.xhr?
      status 422
    else
      erb :'/posts/show'
    end
  end
end
