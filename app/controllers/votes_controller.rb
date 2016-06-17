post '/comments/:id/vote' do
  @new_vote = Vote.new(user: current_user, upvote: params[:upvote])
  @comment = Comment.find(params[:id])
  @post = @comment.commentable
  @new_vote.voteable = @comment
  puts "---------------"
  # puts @new_vote.upvote
  puts @new_vote.valid?
  @new_vote.errors.full_messages.each do |msg|
    puts msg
  end
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
